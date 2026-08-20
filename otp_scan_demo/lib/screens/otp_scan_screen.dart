import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/scan_particles.dart';
import '../widgets/verification_ring.dart';

class OTPScanScreen extends StatefulWidget {
  const OTPScanScreen({
    super.key,
  });

  @override
  State<OTPScanScreen> createState() =>
      _OTPScanScreenState();
}

class _OTPScanScreenState
    extends State<OTPScanScreen>
    with TickerProviderStateMixin {
  // ============================================================
  // CONTROLLERS
  // ============================================================

  late final AnimationController _ringController;
  late final AnimationController _particleController;
  late final AnimationController _pulseController;
  late final AnimationController _lineController;
  late final AnimationController _successController;
  late final AnimationController _scanController;

  // ============================================================
  // INPUT
  // ============================================================

  late final TextEditingController _otpController;
  late final FocusNode _otpFocusNode;

  // ============================================================
  // DEMO
  // ============================================================

  Timer? _demoTimer;

  final String demoOtp = '4826';

  bool demoRunning = true;

  // ============================================================
  // OTP STATE
  // ============================================================

  String otp = '';

  bool verifying = false;
  bool verified = false;

  int activeIndex = -1;

  // ============================================================
  // INIT
  // ============================================================

  @override
  void initState() {
    super.initState();

    _otpController =
        TextEditingController();

    _otpFocusNode = FocusNode();

    _ringController =
    AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    )..repeat();

    _particleController =
    AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    )..repeat();

    _pulseController =
    AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 850,
      ),
    )..repeat(
      reverse: true,
    );

    _lineController =
        AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 900,
          ),
        );

    _successController =
        AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 1000,
          ),
        );

    _scanController =
        AnimationController(
          vsync: this,
          duration: const Duration(
            milliseconds: 1200,
          ),
        );

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      _startDemo();
    });
  }

  // ============================================================
  // START CINEMATIC DEMO
  // ============================================================

  void _startDemo() {
    _demoTimer?.cancel();

    if (!mounted) return;

    setState(() {
      demoRunning = true;
      otp = '';
      activeIndex = -1;
      verifying = false;
      verified = false;
    });

    _otpController.clear();

    _lineController.reset();
    _successController.reset();
    _scanController.stop();

    _demoTimer = Timer(
      const Duration(
        milliseconds: 800,
      ),
      _runDemo,
    );
  }

  // ============================================================
  // CINEMATIC OTP ANIMATION
  // ============================================================

  Future<void> _runDemo() async {
    for (
    int index = 0;
    index < demoOtp.length;
    index++
    ) {
      if (!mounted || !demoRunning) {
        return;
      }

      await Future.delayed(
        const Duration(
          milliseconds: 700,
        ),
      );

      if (!mounted || !demoRunning) {
        return;
      }

      setState(() {
        otp += demoOtp[index];
        activeIndex = index;
      });
    }

    await Future.delayed(
      const Duration(
        milliseconds: 650,
      ),
    );

    if (!mounted || !demoRunning) {
      return;
    }

    setState(() {
      activeIndex = -1;
      verifying = true;
    });

    _lineController
      ..reset()
      ..forward();

    _scanController
      ..reset()
      ..repeat();

    await Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
    );

    if (!mounted || !demoRunning) {
      return;
    }

    _scanController.stop();

    setState(() {
      verifying = false;
      verified = true;
    });

    _successController
      ..reset()
      ..forward();

    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    if (!mounted) return;

    _startDemo();
  }

  // ============================================================
  // REAL USER INPUT
  // ============================================================

  void _onOtpChanged(
      String value,
      ) {
    if (demoRunning) {
      return;
    }

    final cleanValue =
    value.replaceAll(
      RegExp(r'[^0-9]'),
      '',
    );

    if (cleanValue.length > 4) {
      return;
    }

    setState(() {
      otp = cleanValue;

      activeIndex = otp.isEmpty
          ? -1
          : otp.length - 1;
    });

    if (otp.length == 4) {
      _verifyUserOtp();
    }
  }

  // ============================================================
  // SWITCH TO MANUAL INPUT
  // ============================================================

  void _enableManualInput() {
    if (verifying || verified) {
      return;
    }

    _demoTimer?.cancel();

    setState(() {
      demoRunning = false;
    });

    _otpFocusNode.requestFocus();
  }

  // ============================================================
  // VERIFY USER OTP
  // ============================================================

  Future<void> _verifyUserOtp() async {
    if (otp.length != 4 ||
        verifying ||
        verified) {
      return;
    }

    _otpFocusNode.unfocus();

    setState(() {
      verifying = true;
      activeIndex = -1;
    });

    _lineController
      ..reset()
      ..forward();

    _scanController
      ..reset()
      ..repeat();

    await Future.delayed(
      const Duration(
        milliseconds: 1500,
      ),
    );

    if (!mounted) return;

    _scanController.stop();

    if (otp == demoOtp) {
      setState(() {
        verifying = false;
        verified = true;
      });

      _successController
        ..reset()
        ..forward();
    } else {
      setState(() {
        verifying = false;
      });

      _showInvalidOtp();
    }
  }

  // ============================================================
  // INVALID OTP
  // ============================================================

  void _showInvalidOtp() {
    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        backgroundColor:
        const Color(0xff190D18),
        behavior:
        SnackBarBehavior.floating,
        margin:
        const EdgeInsets.all(16),
        shape:
        RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(
            16,
          ),
        ),
        content: const Row(
          children: [
            Icon(
              Icons
                  .error_outline_rounded,
              color:
              Color(0xffF43F5E),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                'Invalid OTP. Demo OTP is 4826.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight:
                  FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(
      BuildContext context,
      ) {
    return Scaffold(
      backgroundColor:
      AppTheme.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (
              context,
              constraints,
              ) {
            return SingleChildScrollView(
              physics:
              const BouncingScrollPhysics(),
              padding:
              const EdgeInsets.fromLTRB(
                16,
                14,
                16,
                18,
              ),
              child: ConstrainedBox(
                constraints:
                BoxConstraints(
                  minHeight:
                  max(
                    560.0,
                    constraints.maxHeight -
                        32.0,
                  ),
                ),
                child: Column(
                  children: [
                    _buildHeader(),

                    const SizedBox(
                      height: 16,
                    ),

                    _buildMainCard(),

                    const SizedBox(
                      height: 13,
                    ),

                    _buildFooter(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // HEADER
  // ============================================================

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 45.0,
          height: 45.0,
          decoration:
          BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              15.0,
            ),
            gradient:
            AppTheme.primaryGradient,
            boxShadow: [
              BoxShadow(
                color:
                AppTheme.primary
                    .withValues(
                  alpha: .30,
                ),
                blurRadius: 22.0,
              ),
            ],
          ),
          child: const Icon(
            Icons
                .fingerprint_rounded,
            color: Colors.white,
            size: 24.0,
          ),
        ),

        const SizedBox(
          width: 11.0,
        ),

        const Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'OTP SCAN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 1.6,
                ),
              ),
              SizedBox(
                height: 3.0,
              ),
              Text(
                'SECURE IDENTITY VERIFICATION',
                style: TextStyle(
                  color:
                  AppTheme.textSecondary,
                  fontSize: 7.0,
                  fontWeight:
                  FontWeight.w800,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),

        _buildSecureBadge(),
      ],
    );
  }

  Widget _buildSecureBadge() {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 7.0,
      ),
      decoration:
      BoxDecoration(
        color:
        AppTheme.cyan.withValues(
          alpha: .07,
        ),
        borderRadius:
        BorderRadius.circular(
          30.0,
        ),
        border: Border.all(
          color:
          AppTheme.cyan.withValues(
            alpha: .18,
          ),
        ),
      ),
      child: const Row(
        mainAxisSize:
        MainAxisSize.min,
        children: [
          Icon(
            Icons.circle,
            color:
            AppTheme.cyan,
            size: 6.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            'SECURE',
            style: TextStyle(
              color:
              AppTheme.cyan,
              fontSize: 7.0,
              fontWeight:
              FontWeight.w900,
              letterSpacing: .8,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MAIN CARD
  // ============================================================

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.fromLTRB(
        17.0,
        18.0,
        17.0,
        17.0,
      ),
      decoration:
      BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          30.0,
        ),
        gradient:
        const LinearGradient(
          begin:
          Alignment.topLeft,
          end:
          Alignment.bottomRight,
          colors: [
            Color(0xff0C1329),
            Color(0xff090F20),
            Color(0xff070B17),
          ],
        ),
        border: Border.all(
          color:
          Colors.white.withValues(
            alpha: .07,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color:
            AppTheme.primary
                .withValues(
              alpha: .12,
            ),
            blurRadius: 45.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color:
            Colors.black.withValues(
              alpha: .45,
            ),
            blurRadius: 30.0,
            offset:
            const Offset(
              0.0,
              18.0,
            ),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius:
              BorderRadius.circular(
                25.0,
              ),
              child: ScanParticles(
                animation:
                _particleController,
              ),
            ),
          ),

          Column(
            children: [
              _buildCardHeader(),

              const SizedBox(
                height: 16.0,
              ),

              AnimatedSwitcher(
                duration:
                const Duration(
                  milliseconds: 500,
                ),
                switchInCurve:
                Curves.easeOutBack,
                switchOutCurve:
                Curves.easeIn,
                child: verified
                    ? _buildSuccessScreen()
                    : _buildOtpScreen(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CARD HEADER
  // ============================================================

  Widget _buildCardHeader() {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'VERIFY YOUR IDENTITY',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: .8,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                'Secure 4-digit verification',
                style: TextStyle(
                  color:
                  AppTheme.textSecondary,
                  fontSize: 8.5,
                ),
              ),
            ],
          ),
        ),

        AnimatedSwitcher(
          duration:
          const Duration(
            milliseconds: 300,
          ),
          child: Icon(
            verified
                ? Icons
                .verified_rounded
                : verifying
                ? Icons
                .radar_rounded
                : Icons
                .lock_outline_rounded,
            key: ValueKey(
              '$verified-$verifying',
            ),
            color: verified
                ? AppTheme.success
                : AppTheme.cyan,
            size: 24.0,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // OTP SCREEN
  // ============================================================

  Widget _buildOtpScreen() {
    return Column(
      children: [
        _buildStatus(),

        const SizedBox(
          height: 8.0,
        ),

        // ======================================================
        // PREMIUM CENTER OTP INPUT
        // ======================================================

        GestureDetector(
          onTap: _enableManualInput,
          behavior:
          HitTestBehavior.opaque,
          child: SizedBox(
            width: double.infinity,
            height: 245.0,
            child: Stack(
              alignment:
              Alignment.center,
              children: [
                // Ambient center glow
                _buildCenterGlow(),

                // Hidden real text field
                _buildHiddenInput(),

                // Circular OTP input
                _buildOtpFormation(),

                // Top scanner label
                Positioned(
                  top: 7.0,
                  child: _buildScanLabel(),
                ),

                // Bottom hint
                Positioned(
                  bottom: 3.0,
                  child: _buildInputHint(),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(
          height: 2.0,
        ),

        _buildProgress(),

        const SizedBox(
          height: 15.0,
        ),

        _buildSecurityMessage(),
      ],
    );
  }

  // ============================================================
  // CENTER GLOW
  // ============================================================

  Widget _buildCenterGlow() {
    return AnimatedBuilder(
      animation:
      _pulseController,
      builder: (
          context,
          child,
          ) {
        final double scale =
            0.90 +
                (_pulseController
                    .value *
                    .12);

        return Transform.scale(
          scale: scale,
          child: Container(
            width: 190.0,
            height: 190.0,
            decoration:
            BoxDecoration(
              shape:
              BoxShape.circle,
              gradient:
              RadialGradient(
                colors: [
                  AppTheme.cyan
                      .withValues(
                    alpha: .055,
                  ),
                  AppTheme.primary
                      .withValues(
                    alpha: .025,
                  ),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // HIDDEN REAL INPUT
  // ============================================================

  Widget _buildHiddenInput() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      top: 90.0,
      child: Opacity(
        opacity: 0.01,
        child: SizedBox(
          height: 55.0,
          child: TextField(
            controller:
            _otpController,
            focusNode:
            _otpFocusNode,
            keyboardType:
            TextInputType.number,
            textInputAction:
            TextInputAction.done,
            maxLength: 4,
            autofocus: false,
            showCursor: false,
            style:
            const TextStyle(
              color: Colors.transparent,
            ),
            decoration:
            const InputDecoration(
              border:
              InputBorder.none,
              counterText: '',
            ),
            onChanged:
            _onOtpChanged,
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SCAN LABEL
  // ============================================================

  Widget _buildScanLabel() {
    String text;

    if (verifying) {
      text = 'ANALYZING SECURE TOKEN';
    } else if (otp.isEmpty) {
      text = 'ENTER 4-DIGIT OTP';
    } else {
      text =
      '${otp.length}/4 DIGITS CAPTURED';
    }

    return AnimatedSwitcher(
      duration:
      const Duration(
        milliseconds: 250,
      ),
      child: Container(
        key: ValueKey(text),
        padding:
        const EdgeInsets.symmetric(
          horizontal: 11.0,
          vertical: 5.0,
        ),
        decoration:
        BoxDecoration(
          color:
          Colors.black.withValues(
            alpha: .22,
          ),
          borderRadius:
          BorderRadius.circular(
            20.0,
          ),
          border: Border.all(
            color:
            AppTheme.cyan
                .withValues(
              alpha: .12,
            ),
          ),
        ),
        child: Row(
          mainAxisSize:
          MainAxisSize.min,
          children: [
            if (verifying)
              const SizedBox(
                width: 8.0,
                height: 8.0,
                child:
                CircularProgressIndicator(
                  strokeWidth: 1.3,
                  color:
                  AppTheme.cyan,
                ),
              )
            else
              const Icon(
                Icons.circle,
                color:
                AppTheme.cyan,
                size: 5.0,
              ),
            const SizedBox(
              width: 6.0,
            ),
            Text(
              text,
              style:
              const TextStyle(
                color:
                AppTheme.cyan,
                fontSize: 6.5,
                fontWeight:
                FontWeight.w900,
                letterSpacing:
                1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // INPUT HINT
  // ============================================================

  Widget _buildInputHint() {
    return AnimatedOpacity(
      opacity:
      otp.isEmpty &&
          !verifying
          ? 1.0
          : .0,
      duration:
      const Duration(
        milliseconds: 300,
      ),
      child: const Text(
        'TAP TO ENTER OTP',
        style:
        TextStyle(
          color:
          Colors.white24,
          fontSize: 6.5,
          fontWeight:
          FontWeight.w800,
          letterSpacing:
          1.1,
        ),
      ),
    );
  }

  // ============================================================
  // OTP FORMATION
  // ============================================================

  Widget _buildOtpFormation() {
    return LayoutBuilder(
      builder: (
          context,
          constraints,
          ) {
        final double width =
            constraints.maxWidth;

        final double spacing =
        min(
          55.0,
          max(
            42.0,
            (width - 40.0) /
                3.0,
          ),
        );

        final double centerX =
            width / 2.0;

        final double centerY =
        126.0;

        final List<Offset>
        positions = [
          Offset(
            centerX -
                spacing * 1.5,
            centerY,
          ),
          Offset(
            centerX -
                spacing * .5,
            centerY,
          ),
          Offset(
            centerX +
                spacing * .5,
            centerY,
          ),
          Offset(
            centerX +
                spacing * 1.5,
            centerY,
          ),
        ];

        return Stack(
          clipBehavior:
          Clip.none,
          children: [
            if (otp.length == 4 ||
                verifying)
              _buildConnectionLine(
                centerX,
                spacing,
                centerY,
              ),

            for (int i = 0;
            i < 4;
            i++)
              if (i < otp.length)
                _buildMovingDigit(
                  index: i,
                  digit: otp[i],
                  target:
                  positions[i],
                ),
          ],
        );
      },
    );
  }

  // ============================================================
  // PREMIUM CONNECTION LINE
  // ============================================================

  Widget _buildConnectionLine(
      double centerX,
      double spacing,
      double centerY,
      ) {
    final double totalWidth =
        spacing * 3.0;

    return Positioned(
      left:
      centerX -
          (totalWidth / 2.0),
      top:
      centerY - 1.0,
      child: AnimatedBuilder(
        animation:
        _lineController,
        builder: (
            context,
            child,
            ) {
          final double value =
          Curves.easeOutCubic
              .transform(
            _lineController.value,
          );

          return SizedBox(
            width:
            totalWidth * value,
            height: 3.0,
            child: Stack(
              children: [
                Container(
                  decoration:
                  BoxDecoration(
                    gradient:
                    const LinearGradient(
                      colors: [
                        Color(
                          0xff7C3AED,
                        ),
                        Color(
                          0xff22D3EE,
                        ),
                        Color(
                          0xff22C55E,
                        ),
                      ],
                    ),
                    borderRadius:
                    BorderRadius
                        .circular(
                      20.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color:
                        AppTheme.cyan
                            .withValues(
                          alpha: .45,
                        ),
                        blurRadius:
                        9.0,
                      ),
                    ],
                  ),
                ),

                // Moving scan dot
                if (verifying)
                  Align(
                    alignment:
                    Alignment(
                      value *
                          2.0 -
                          1.0,
                      0.0,
                    ),
                    child:
                    Container(
                      width: 6.0,
                      height: 6.0,
                      decoration:
                      const BoxDecoration(
                        shape:
                        BoxShape
                            .circle,
                        color:
                        Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ============================================================
  // MOVING DIGIT
  // ============================================================

  Widget _buildMovingDigit({
    required int index,
    required String digit,
    required Offset target,
  }) {
    Offset start;

    switch (index) {
      case 0:
        start = Offset(
          target.dx,
          target.dy + 120.0,
        );
        break;

      case 1:
        start = Offset(
          target.dx + 125.0,
          target.dy - 30.0,
        );
        break;

      case 2:
        start = Offset(
          target.dx,
          target.dy - 120.0,
        );
        break;

      default:
        start = Offset(
          target.dx - 125.0,
          target.dy + 30.0,
        );
        break;
    }

    return TweenAnimationBuilder<
        double>(
      key: ValueKey(
        'digit-$index-$digit',
      ),
      tween: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ),
      duration:
      const Duration(
        milliseconds: 850,
      ),
      curve:
      Curves.elasticOut,
      builder: (
          context,
          value,
          child,
          ) {
        final double x =
            start.dx +
                ((target.dx -
                    start.dx) *
                    value);

        final double y =
            start.dy +
                ((target.dy -
                    start.dy) *
                    value);

        final double scale =
            0.70 +
                (0.30 * value);

        final double rotation =
            (1.0 - value) *
                (index.isEven
                    ? -.25
                    : .25);

        return Positioned(
          left: x - 34.0,
          top: y - 34.0,
          child:
          Transform.rotate(
            angle: rotation,
            child:
            Transform.scale(
              scale: scale,
              child:
              _buildDigitCircle(
                digit,
                index,
              ),
            ),
          ),
        );
      },
    );
  }

  // ============================================================
  // PREMIUM DIGIT CIRCLE
  // ============================================================

  Widget _buildDigitCircle(
      String digit,
      int index,
      ) {
    final bool active =
        activeIndex == index &&
            !verifying;

    return AnimatedBuilder(
      animation:
      Listenable.merge([
        _pulseController,
        _ringController,
      ]),
      builder: (
          context,
          child,
          ) {
        final double pulse =
        active
            ? _pulseController
            .value *
            4.0
            : 0.0;

        final double size =
            54.0 + pulse;

        return SizedBox(
          width: 68.0,
          height: 68.0,
          child: Stack(
            alignment:
            Alignment.center,
            children: [
              // Outer glow
              if (active)
                Container(
                  width: 67.0,
                  height: 67.0,
                  decoration:
                  BoxDecoration(
                    shape:
                    BoxShape.circle,
                    border:
                    Border.all(
                      color:
                      AppTheme.cyan
                          .withValues(
                        alpha: .08,
                      ),
                      width: 1.0,
                    ),
                  ),
                ),

              // Rotating segmented ring
              if (active)
                Transform.rotate(
                  angle:
                  _ringController
                      .value *
                      pi *
                      2.0,
                  child:
                  CustomPaint(
                    size:
                    const Size(
                      68.0,
                      68.0,
                    ),
                    painter:
                    _PremiumRingPainter(
                      primary:
                      AppTheme.cyan,
                      secondary:
                      AppTheme.primary,
                    ),
                  ),
                ),

              // Second orbit
              if (active)
                Transform.rotate(
                  angle:
                  -_ringController
                      .value *
                      pi *
                      1.3,
                  child:
                  CustomPaint(
                    size:
                    const Size(
                      61.0,
                      61.0,
                    ),
                    painter:
                    _OrbitPainter(),
                  ),
                ),

              // Main circle
              AnimatedContainer(
                duration:
                const Duration(
                  milliseconds: 280,
                ),
                width: size,
                height: size,
                decoration:
                BoxDecoration(
                  shape:
                  BoxShape.circle,
                  gradient:
                  const RadialGradient(
                    center:
                    Alignment(
                      -.25,
                      -.30,
                    ),
                    radius: .9,
                    colors: [
                      Color(
                        0xff182743,
                      ),
                      Color(
                        0xff0D172B,
                      ),
                      Color(
                        0xff080F1F,
                      ),
                    ],
                  ),
                  border:
                  Border.all(
                    color: active
                        ? AppTheme.cyan
                        : AppTheme.primary
                        .withValues(
                      alpha: .75,
                    ),
                    width:
                    active
                        ? 2.0
                        : 1.3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: active
                          ? AppTheme.cyan
                          .withValues(
                        alpha: .35,
                      )
                          : AppTheme.primary
                          .withValues(
                        alpha: .12,
                      ),
                      blurRadius:
                      active
                          ? 24.0
                          : 12.0,
                      spreadRadius:
                      active
                          ? 1.0
                          : 0.0,
                    ),
                  ],
                ),
                child:
                Center(
                  child:
                  AnimatedSwitcher(
                    duration:
                    const Duration(
                      milliseconds: 220,
                    ),
                    transitionBuilder:
                        (
                        child,
                        animation,
                        ) {
                      return ScaleTransition(
                        scale:
                        CurvedAnimation(
                          parent:
                          animation,
                          curve:
                          Curves
                              .easeOutBack,
                        ),
                        child:
                        child,
                      );
                    },
                    child:
                    Text(
                      digit,
                      key: ValueKey(
                        digit,
                      ),
                      style:
                      const TextStyle(
                        color:
                        Colors.white,
                        fontSize:
                        20.0,
                        fontWeight:
                        FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),

              // Active scanning dot
              if (active)
                Positioned(
                  top: 3.0,
                  right: 10.0,
                  child:
                  Container(
                    width: 6.0,
                    height: 6.0,
                    decoration:
                    BoxDecoration(
                      shape:
                      BoxShape.circle,
                      color:
                      AppTheme.cyan,
                      boxShadow: [
                        BoxShadow(
                          color:
                          AppTheme.cyan,
                          blurRadius:
                          9.0,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // STATUS
  // ============================================================

  Widget _buildStatus() {
    String title;
    String subtitle;

    if (verifying) {
      title = 'SCANNING OTP';
      subtitle =
      'Validating secure verification token...';
    } else if (otp.isEmpty) {
      title = 'OTP READY';
      subtitle =
      'Tap the center and enter your 4-digit code';
    } else {
      title =
      '${otp.length} / 4 DIGITS';
      subtitle =
      'Secure input captured';
    }

    return AnimatedSwitcher(
      duration:
      const Duration(
        milliseconds: 300,
      ),
      child: Column(
        key: ValueKey(
          '$title-$subtitle',
        ),
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.center,
            children: [
              if (verifying)
                const SizedBox(
                  width: 11.0,
                  height: 11.0,
                  child:
                  CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color:
                    AppTheme.cyan,
                  ),
                )
              else
                const Icon(
                  Icons
                      .radio_button_checked_rounded,
                  color:
                  AppTheme.cyan,
                  size: 12.0,
                ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                title,
                style:
                const TextStyle(
                  color:
                  AppTheme.cyan,
                  fontSize: 8.0,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing:
                  1.2,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            subtitle,
            textAlign:
            TextAlign.center,
            style:
            const TextStyle(
              color:
              AppTheme.textSecondary,
              fontSize: 8.0,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PROGRESS
  // ============================================================

  Widget _buildProgress() {
    final double progress =
        otp.length / 4.0;

    return Column(
      children: [
        Row(
          children: [
            const Text(
              'VERIFICATION PROGRESS',
              style:
              TextStyle(
                color:
                Colors.white38,
                fontSize: 6.5,
                fontWeight:
                FontWeight.w800,
                letterSpacing:
                .8,
              ),
            ),
            const Spacer(),
            Text(
              '${(progress * 100.0).round()}%',
              style:
              const TextStyle(
                color:
                AppTheme.cyan,
                fontSize: 7.5,
                fontWeight:
                FontWeight.w900,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 7.0,
        ),
        ClipRRect(
          borderRadius:
          BorderRadius.circular(
            20.0,
          ),
          child:
          TweenAnimationBuilder<
              double>(
            tween: Tween<double>(
              begin: 0.0,
              end: progress,
            ),
            duration:
            const Duration(
              milliseconds: 350,
            ),
            curve:
            Curves.easeOutCubic,
            builder: (
                context,
                value,
                child,
                ) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 3.0,
                backgroundColor:
                Colors.white
                    .withValues(
                  alpha: .055,
                ),
                valueColor:
                const AlwaysStoppedAnimation<
                    Color>(
                  AppTheme.cyan,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SECURITY MESSAGE
  // ============================================================

  Widget _buildSecurityMessage() {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.symmetric(
        horizontal: 11.0,
        vertical: 10.0,
      ),
      decoration:
      BoxDecoration(
        color:
        AppTheme.primary
            .withValues(
          alpha: .045,
        ),
        borderRadius:
        BorderRadius.circular(
          14.0,
        ),
        border: Border.all(
          color:
          AppTheme.primary
              .withValues(
            alpha: .11,
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(
            Icons
                .shield_outlined,
            color:
            AppTheme.primary,
            size: 16.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Text(
              'Your verification code is securely processed and protected.',
              style: TextStyle(
                color:
                Colors.white54,
                fontSize: 7.5,
              ),
            ),
          ),
          Icon(
            Icons
                .lock_rounded,
            color:
            Colors.white24,
            size: 12.0,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // SUCCESS SCREEN
  // ============================================================

  Widget _buildSuccessScreen() {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),

        SizedBox(
          height: 190.0,
          child: VerificationRing(
            rotation:
            _successController,
            pulse:
            _pulseController,
          ),
        ),

        const SizedBox(
          height: 3.0,
        ),

        const Text(
          'OTP VERIFIED',
          style:
          TextStyle(
            color:
            AppTheme.success,
            fontSize: 22.0,
            fontWeight:
            FontWeight.w900,
            letterSpacing: 1.8,
          ),
        ),

        const SizedBox(
          height: 7.0,
        ),

        const Text(
          'IDENTITY CONFIRMED',
          style:
          TextStyle(
            color: Colors.white,
            fontSize: 9.0,
            fontWeight:
            FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),

        const SizedBox(
          height: 5.0,
        ),

        const Text(
          'Verification completed successfully.',
          textAlign:
          TextAlign.center,
          style:
          TextStyle(
            color:
            AppTheme.textSecondary,
            fontSize: 8.5,
          ),
        ),

        const SizedBox(
          height: 18.0,
        ),

        _buildSuccessStats(),

        const SizedBox(
          height: 15.0,
        ),

        Container(
          width: double.infinity,
          height: 44.0,
          decoration:
          BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              14.0,
            ),
            gradient:
            AppTheme.successGradient,
            boxShadow: [
              BoxShadow(
                color:
                AppTheme.success
                    .withValues(
                  alpha: .22,
                ),
                blurRadius: 22.0,
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'VERIFICATION COMPLETE',
              style:
              TextStyle(
                color: Colors.white,
                fontSize: 8.5,
                fontWeight:
                FontWeight.w900,
                letterSpacing:
                1.1,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // SUCCESS STATS
  // ============================================================

  Widget _buildSuccessStats() {
    return Row(
      children: [
        Expanded(
          child: _successStat(
            Icons
                .check_circle_rounded,
            'OTP',
            'VALID',
          ),
        ),
        const SizedBox(
          width: 7.0,
        ),
        Expanded(
          child: _successStat(
            Icons
                .shield_rounded,
            'SECURITY',
            'ACTIVE',
          ),
        ),
        const SizedBox(
          width: 7.0,
        ),
        Expanded(
          child: _successStat(
            Icons
                .verified_user_rounded,
            'IDENTITY',
            'CONFIRMED',
          ),
        ),
      ],
    );
  }

  Widget _successStat(
      IconData icon,
      String title,
      String value,
      ) {
    return Container(
      height: 62.0,
      padding:
      const EdgeInsets.all(
        4.0,
      ),
      decoration:
      BoxDecoration(
        color:
        AppTheme.success
            .withValues(
          alpha: .045,
        ),
        borderRadius:
        BorderRadius.circular(
          13.0,
        ),
        border: Border.all(
          color:
          AppTheme.success
              .withValues(
            alpha: .13,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment:
        MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
            AppTheme.success,
            size: 16.0,
          ),
          const SizedBox(
            height: 3.0,
          ),
          FittedBox(
            fit:
            BoxFit.scaleDown,
            child: Text(
              title,
              style:
              const TextStyle(
                color: Colors.white,
                fontSize: 7.0,
                fontWeight:
                FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          FittedBox(
            fit:
            BoxFit.scaleDown,
            child: Text(
              value,
              style:
              const TextStyle(
                color:
                AppTheme.success,
                fontSize: 5.5,
                fontWeight:
                FontWeight.w900,
                letterSpacing:
                .4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // FOOTER
  // ============================================================

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        const Icon(
          Icons
              .verified_user_outlined,
          color: Colors.white24,
          size: 13.0,
        ),
        const SizedBox(
          width: 6.0,
        ),
        Flexible(
          child: Text(
            'END-TO-END SECURE VERIFICATION',
            textAlign:
            TextAlign.center,
            style:
            TextStyle(
              color:
              Colors.white.withValues(
                alpha: .25,
              ),
              fontSize: 6.5,
              fontWeight:
              FontWeight.w800,
              letterSpacing:
              .8,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _demoTimer?.cancel();

    _otpController.dispose();
    _otpFocusNode.dispose();

    _ringController.dispose();
    _particleController.dispose();
    _pulseController.dispose();
    _lineController.dispose();
    _successController.dispose();
    _scanController.dispose();

    super.dispose();
  }
}

// ============================================================================
// PREMIUM OTP RING
// ============================================================================

class _PremiumRingPainter
    extends CustomPainter {
  final Color primary;
  final Color secondary;

  const _PremiumRingPainter({
    required this.primary,
    required this.secondary,
  });

  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final Offset center = Offset(
      size.width / 2.0,
      size.height / 2.0,
    );

    final double radius =
        size.width / 2.0 - 3.0;

    final Rect rect =
    Rect.fromCircle(
      center: center,
      radius: radius,
    );

    final Paint paint = Paint()
      ..style =
          PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap =
          StrokeCap.round
      ..shader =
      SweepGradient(
        colors: [
          Colors.transparent,
          primary,
          secondary,
          Colors.transparent,
        ],
      ).createShader(rect);

    canvas.drawArc(
      rect,
      -pi / 2.0,
      pi * 1.45,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _PremiumRingPainter
      oldDelegate,
      ) {
    return true;
  }
}

// ============================================================================
// ORBIT RING
// ============================================================================

class _OrbitPainter
    extends CustomPainter {
  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final Offset center = Offset(
      size.width / 2.0,
      size.height / 2.0,
    );

    final double radius =
        size.width / 2.0 - 4.0;

    final Paint paint = Paint()
      ..style =
          PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color =
      Colors.white.withValues(
        alpha: .18,
      );

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      0.2,
      pi * .65,
      false,
      paint,
    );

    paint.color =
        const Color(
          0xff22D3EE,
        ).withValues(
          alpha: .35,
        );

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      pi * 1.15,
      pi * .45,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _OrbitPainter
      oldDelegate,
      ) {
    return true;
  }
}