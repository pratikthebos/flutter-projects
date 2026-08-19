import 'dart:math';

import 'package:flutter/material.dart';

class SecurityScannerDemo extends StatefulWidget {
  const SecurityScannerDemo({
    super.key,
  });

  @override
  State<SecurityScannerDemo> createState() =>
      _SecurityScannerDemoState();
}

class _SecurityScannerDemoState
    extends State<SecurityScannerDemo>
    with TickerProviderStateMixin {
  late AnimationController scanController;
  late AnimationController radarController;
  late AnimationController pulseController;

  bool scanning = true;
  bool scanCompleted = false;

  int scanIndex = 0;
  int threats = 0;
  int protectedChecks = 0;

  double progress = 0;

  final List<String> scanItems = [
    'Device Integrity',
    'Root Detection',
    'Developer Mode',
    'USB Debugging',
    'App Tampering',
    'Network Security',
    'Screen Capture',
    'SSL Certificate',
    'Malware Detection',
    'Data Encryption',
    'Runtime Protection',
    'System Integrity',
  ];

  @override
  void initState() {
    super.initState();

    // ==============================================================
    // MAIN SCAN
    // 0% → 100%
    // ==============================================================

    scanController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 18,
      ),
    )..addListener(_scanListener);

    // ==============================================================
    // RADAR
    // ==============================================================

    radarController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    )..repeat();

    // ==============================================================
    // PULSE
    // ==============================================================

    pulseController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1100,
      ),
    )..repeat(
      reverse: true,
    );

    // Start scanning.
    scanController.forward();
  }

  // ================================================================
  // SCAN LISTENER
  // ================================================================

  void _scanListener() {
    if (!mounted || scanCompleted) {
      return;
    }

    final value = scanController.value;

    setState(() {
      progress = value;

      scanIndex = (value * scanItems.length)
          .floor()
          .clamp(
        0,
        scanItems.length - 1,
      );

      protectedChecks =
          (value * 12).floor();
    });

    // ==============================================================
    // WHEN SCAN REACHES 100%
    // ==============================================================

    if (value >= .999) {
      _finishScan();
    }
  }

  // ================================================================
  // SCAN COMPLETE
  // ==============================================================

  void _finishScan() {
    if (scanCompleted) {
      return;
    }

    scanController.stop();

    setState(() {
      progress = 1.0;
      scanCompleted = true;
      scanning = false;

      protectedChecks = 12;
      threats = 0;
    });

    // --------------------------------------------------------------
    // SHOW RESULT FOR 4 SECONDS
    // --------------------------------------------------------------

    Future.delayed(
      const Duration(
        seconds: 4,
      ),
          () {
        if (!mounted) {
          return;
        }

        _startNewScan();
      },
    );
  }

  // ================================================================
  // START NEW SCAN
  // ==============================================================

  void _startNewScan() {
    setState(() {
      scanning = true;
      scanCompleted = false;

      progress = 0;

      scanIndex = 0;

      protectedChecks = 0;

      threats = 0;
    });

    scanController
      ..reset()
      ..forward();
  }

  // ================================================================
  // MANUAL SCAN BUTTON
  // ==============================================================

  void _handleScanButton() {
    if (scanCompleted) {
      _startNewScan();
      return;
    }

    if (scanning) {
      scanController.stop();

      setState(() {
        scanning = false;
      });
    } else {
      setState(() {
        scanning = true;
      });

      scanController.forward();
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 355,
              minHeight: screen.height - 24,
            ),
            child: _buildScanner(),
          ),
        ),
      ),
    );
  }

  // ================================================================
  // MAIN CONTAINER
  // ==============================================================

  Widget _buildScanner() {
    return Container(
      width: 355,
      padding:
      const EdgeInsets.fromLTRB(
        20,
        18,
        20,
        20,
      ),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          32,
        ),
        gradient:
        const LinearGradient(
          begin:
          Alignment.topLeft,
          end:
          Alignment.bottomRight,
          colors: [
            Color(0xff07121B),
            Color(0xff0A1822),
            Color(0xff071019),
            Color(0xff050B11),
          ],
        ),
        border: Border.all(
          color: const Color(
            0xff00E5A8,
          ).withValues(
            alpha: .18,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(
              0xff00E5A8,
            ).withValues(
              alpha: .10,
            ),
            blurRadius: 45,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withValues(
              alpha: .40,
            ),
            blurRadius: 35,
            offset: const Offset(
              0,
              20,
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildHeader(),

          const SizedBox(
            height: 14,
          ),

          if (scanCompleted)
            _buildScanResult()
          else
            _buildScanningView(),

          const SizedBox(
            height: 12,
          ),

          _buildActionButtons(),
        ],
      ),
    );
  }

  // ================================================================
  // SCANNING VIEW
  // ==============================================================

  Widget _buildScanningView() {
    return Column(
      children: [
        _buildStatus(),

        const SizedBox(
          height: 18,
        ),

        _buildRadar(),

        const SizedBox(
          height: 18,
        ),

        _buildScanInformation(),

        const SizedBox(
          height: 15,
        ),

        _buildProgress(),

        const SizedBox(
          height: 15,
        ),

        _buildStats(),

        const SizedBox(
          height: 15,
        ),

        _buildScanButton(),
      ],
    );
  }

  // ================================================================
  // HEADER
  // ==============================================================

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 43,
          height: 43,
          decoration:
          BoxDecoration(
            borderRadius:
            BorderRadius.circular(
              14,
            ),
            gradient:
            const LinearGradient(
              colors: [
                Color(0xff0CE6A8),
                Color(0xff00A6FF),
              ],
            ),
          ),
          child: const Icon(
            Icons.shield_rounded,
            color: Colors.white,
            size: 23,
          ),
        ),

        const SizedBox(
          width: 11,
        ),

        const Expanded(
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                'SECURESCAN AI',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'ADVANCED SECURITY ENGINE',
                style: TextStyle(
                  color: Color(
                    0xff6B8495,
                  ),
                  fontSize: 7,
                  fontWeight:
                  FontWeight.w700,
                  letterSpacing: 1.3,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding:
          const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 6,
          ),
          decoration:
          BoxDecoration(
            color: const Color(
              0xff00E5A8,
            ).withValues(
              alpha: .08,
            ),
            borderRadius:
            BorderRadius.circular(
              20,
            ),
            border: Border.all(
              color: const Color(
                0xff00E5A8,
              ).withValues(
                alpha: .20,
              ),
            ),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.circle,
                size: 6,
                color: Color(
                  0xff00E5A8,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'LIVE',
                style: TextStyle(
                  color: Color(
                    0xff00E5A8,
                  ),
                  fontSize: 8,
                  fontWeight:
                  FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================================================================
  // STATUS
  // ==============================================================

  Widget _buildStatus() {
    final percentage =
    (progress * 100).toInt();

    return Row(
      children: [
        const Icon(
          Icons.radar_rounded,
          color: Color(
            0xff00E5A8,
          ),
          size: 16,
        ),

        const SizedBox(
          width: 7,
        ),

        Text(
          scanning
              ? 'SCANNING SYSTEM...'
              : 'SCAN PAUSED',
          style: const TextStyle(
            color: Color(
              0xff00E5A8,
            ),
            fontSize: 9,
            fontWeight:
            FontWeight.w900,
            letterSpacing: 1.4,
          ),
        ),

        const Spacer(),

        Text(
          '$percentage%',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight:
            FontWeight.w900,
          ),
        ),
      ],
    );
  }

  // ================================================================
  // RADAR
  // ==============================================================

  Widget _buildRadar() {
    final rotation =
        radarController.value *
            pi *
            2;

    final pulse =
        1 +
            pulseController.value *
                .035;

    return SizedBox(
      width: 205,
      height: 205,
      child: Stack(
        alignment:
        Alignment.center,
        children: [
          // ----------------------------------------------------------
          // OUTER PULSE
          // ----------------------------------------------------------

          Transform.scale(
            scale: pulse,
            child: Container(
              width: 190,
              height: 190,
              decoration:
              BoxDecoration(
                shape:
                BoxShape.circle,
                border: Border.all(
                  color:
                  const Color(
                    0xff00E5A8,
                  ).withValues(
                    alpha: .10,
                  ),
                  width: 1,
                ),
              ),
            ),
          ),

          // ----------------------------------------------------------
          // RADAR GRID
          // ----------------------------------------------------------

          Container(
            width: 175,
            height: 175,
            decoration:
            const BoxDecoration(
              shape:
              BoxShape.circle,
              gradient:
              RadialGradient(
                colors: [
                  Color(
                    0xff0E2930,
                  ),
                  Color(
                    0xff07151D,
                  ),
                ],
              ),
            ),
            child: CustomPaint(
              painter:
              _RadarGridPainter(),
            ),
          ),

          // ----------------------------------------------------------
          // RADAR BEAM
          // ----------------------------------------------------------

          Transform.rotate(
            angle: rotation,
            child: CustomPaint(
              size:
              const Size(
                175,
                175,
              ),
              painter:
              _RadarBeamPainter(),
            ),
          ),

          // ----------------------------------------------------------
          // INNER RINGS
          // ----------------------------------------------------------

          Container(
            width: 115,
            height: 115,
            decoration:
            BoxDecoration(
              shape:
              BoxShape.circle,
              border: Border.all(
                color:
                const Color(
                  0xff00E5A8,
                ).withValues(
                  alpha: .22,
                ),
              ),
            ),
          ),

          Container(
            width: 65,
            height: 65,
            decoration:
            BoxDecoration(
              shape:
              BoxShape.circle,
              border: Border.all(
                color:
                const Color(
                  0xff00E5A8,
                ).withValues(
                  alpha: .35,
                ),
              ),
            ),
          ),

          // ----------------------------------------------------------
          // CENTER SHIELD
          // ----------------------------------------------------------

          Container(
            width: 58,
            height: 58,
            decoration:
            BoxDecoration(
              shape:
              BoxShape.circle,
              gradient:
              const LinearGradient(
                begin:
                Alignment.topLeft,
                end:
                Alignment.bottomRight,
                colors: [
                  Color(
                    0xff0CE6A8,
                  ),
                  Color(
                    0xff008F72,
                  ),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color:
                  const Color(
                    0xff00E5A8,
                  ).withValues(
                    alpha: .28,
                  ),
                  blurRadius: 22,
                ),
              ],
            ),
            child: const Icon(
              Icons.security_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),

          _scanPoint(
            top: 23,
            right: 38,
          ),

          _scanPoint(
            bottom: 38,
            left: 23,
          ),

          _scanPoint(
            bottom: 28,
            right: 28,
          ),
        ],
      ),
    );
  }

  Widget _scanPoint({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 6,
        height: 6,
        decoration:
        const BoxDecoration(
          shape:
          BoxShape.circle,
          color: Color(
            0xff00E5A8,
          ),
        ),
      ),
    );
  }

  // ================================================================
  // CURRENT SCAN
  // ==============================================================

  Widget _buildScanInformation() {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12,
      ),
      decoration:
      BoxDecoration(
        color:
        Colors.white.withValues(
          alpha: .035,
        ),
        borderRadius:
        BorderRadius.circular(
          17,
        ),
        border: Border.all(
          color:
          Colors.white.withValues(
            alpha: .06,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration:
            BoxDecoration(
              color:
              const Color(
                0xff00E5A8,
              ).withValues(
                alpha: .08,
              ),
              borderRadius:
              BorderRadius.circular(
                11,
              ),
            ),
            child: const Icon(
              Icons.search_rounded,
              color: Color(
                0xff00E5A8,
              ),
              size: 19,
            ),
          ),

          const SizedBox(
            width: 10,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  scanItems[
                  scanIndex],
                  style:
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight:
                    FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  'Security verification in progress',
                  style:
                  TextStyle(
                    color:
                    Colors.white
                        .withValues(
                      alpha: .38,
                    ),
                    fontSize: 8,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.more_horiz_rounded,
            color: Color(
              0xff00E5A8,
            ),
            size: 18,
          ),
        ],
      ),
    );
  }

  // ================================================================
  // PROGRESS
  // ==============================================================

  Widget _buildProgress() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              'SYSTEM ANALYSIS',
              style: TextStyle(
                color: Color(
                  0xff6B8495,
                ),
                fontSize: 7,
                fontWeight:
                FontWeight.w800,
                letterSpacing: 1.1,
              ),
            ),
            const Spacer(),
            Text(
              '${(progress * 100).toInt()} / 100',
              style: const TextStyle(
                color:
                Colors.white70,
                fontSize: 8,
                fontWeight:
                FontWeight.w700,
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 7,
        ),

        Container(
          height: 6,
          decoration:
          BoxDecoration(
            color:
            Colors.white.withValues(
              alpha: .06,
            ),
            borderRadius:
            BorderRadius.circular(
              20,
            ),
          ),
          child:
          FractionallySizedBox(
            alignment:
            Alignment.centerLeft,
            widthFactor:
            progress,
            child: Container(
              decoration:
              BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                  20,
                ),
                gradient:
                const LinearGradient(
                  colors: [
                    Color(
                      0xff00E5A8,
                    ),
                    Color(
                      0xff00B8FF,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ================================================================
  // STATS
  // ==============================================================

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            icon:
            Icons.verified_user_rounded,
            value:
            '$protectedChecks',
            label: 'PROTECTED',
            color:
            const Color(
              0xff00E5A8,
            ),
          ),
        ),

        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: _statCard(
            icon:
            Icons.warning_amber_rounded,
            value: '$threats',
            label: 'THREATS',
            color:
            const Color(
              0xffFFB020,
            ),
          ),
        ),

        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: _statCard(
            icon: Icons.speed_rounded,
            value: '98',
            label: 'SCORE',
            color:
            const Color(
              0xff43B5FF,
            ),
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required IconData icon,
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding:
      const EdgeInsets.symmetric(
        vertical: 11,
      ),
      decoration:
      BoxDecoration(
        color:
        Colors.white.withValues(
          alpha: .035,
        ),
        borderRadius:
        BorderRadius.circular(
          15,
        ),
        border: Border.all(
          color:
          Colors.white.withValues(
            alpha: .055,
          ),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 17,
          ),

          const SizedBox(
            height: 4,
          ),

          Text(
            value,
            style:
            const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight:
              FontWeight.w900,
            ),
          ),

          const SizedBox(
            height: 2,
          ),

          Text(
            label,
            style: TextStyle(
              color:
              Colors.white.withValues(
                alpha: .36,
              ),
              fontSize: 6.5,
              fontWeight:
              FontWeight.w800,
              letterSpacing: .7,
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // SCAN BUTTON
  // ==============================================================

  Widget _buildScanButton() {
    return GestureDetector(
      onTap: _handleScanButton,
      child: AnimatedContainer(
        duration:
        const Duration(
          milliseconds: 250,
        ),
        width: double.infinity,
        height: 48,
        decoration:
        BoxDecoration(
          borderRadius:
          BorderRadius.circular(
            17,
          ),
          gradient:
          const LinearGradient(
            colors: [
              Color(
                0xff00B889,
              ),
              Color(
                0xff00A4D6,
              ),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color:
              const Color(
                0xff00E5A8,
              ).withValues(
                alpha: .15,
              ),
              blurRadius: 18,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              scanning
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              color: Colors.white,
              size: 19,
            ),

            const SizedBox(
              width: 8,
            ),

            Text(
              scanning
                  ? 'PAUSE SCAN'
                  : 'RESUME SCAN',
              style:
              const TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight:
                FontWeight.w900,
                letterSpacing: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================================================================
  // FINAL RESULT
  // ==============================================================

  Widget _buildScanResult() {
    return SizedBox(
      height: 420,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          // ----------------------------------------------------------
          // SUCCESS ANIMATION
          // ----------------------------------------------------------

          AnimatedBuilder(
            animation:
            pulseController,
            builder: (
                context,
                child,
                ) {
              final scale =
                  1 +
                      pulseController
                          .value *
                          .06;

              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child:
            Container(
              width: 108,
              height: 108,
              decoration:
              BoxDecoration(
                shape:
                BoxShape.circle,
                gradient:
                const LinearGradient(
                  begin:
                  Alignment.topLeft,
                  end:
                  Alignment.bottomRight,
                  colors: [
                    Color(
                      0xff00E5A8,
                    ),
                    Color(
                      0xff008F72,
                    ),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                    const Color(
                      0xff00E5A8,
                    ).withValues(
                      alpha: .35,
                    ),
                    blurRadius: 35,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child:
              const Icon(
                Icons.check_rounded,
                color:
                Colors.white,
                size: 58,
              ),
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          const Text(
            'SCAN SUCCESSFUL',
            style:
            TextStyle(
              color:
              Color(
                0xff00E5A8,
              ),
              fontSize: 18,
              fontWeight:
              FontWeight.w900,
              letterSpacing: 2,
            ),
          ),

          const SizedBox(
            height: 8,
          ),

          const Text(
            'NO MALWARE DETECTED',
            textAlign:
            TextAlign.center,
            style:
            TextStyle(
              color:
              Colors.white,
              fontSize: 14,
              fontWeight:
              FontWeight.w900,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(
            height: 6,
          ),

          Text(
            'Your device is secure',
            style:
            TextStyle(
              color:
              Colors.white.withValues(
                alpha: .45,
              ),
              fontSize: 10,
            ),
          ),

          const SizedBox(
            height: 22,
          ),

          // ----------------------------------------------------------
          // RESULT STATISTICS
          // ----------------------------------------------------------

          Row(
            children: [
              Expanded(
                child:
                _resultItem(
                  icon: Icons
                      .verified_user_rounded,
                  title: '12',
                  subtitle:
                  'CHECKS PASSED',
                ),
              ),

              const SizedBox(
                width: 8,
              ),

              Expanded(
                child:
                _resultItem(
                  icon: Icons
                      .bug_report_rounded,
                  title: '0',
                  subtitle:
                  'THREATS',
                ),
              ),

              const SizedBox(
                width: 8,
              ),

              Expanded(
                child:
                _resultItem(
                  icon: Icons
                      .security_rounded,
                  title: '98%',
                  subtitle:
                  'SECURE',
                ),
              ),
            ],
          ),

          const Spacer(),

          // ----------------------------------------------------------
          // RESULT MESSAGE
          // ----------------------------------------------------------

          Container(
            width:
            double.infinity,
            padding:
            const EdgeInsets
                .symmetric(
              horizontal: 12,
              vertical: 11,
            ),
            decoration:
            BoxDecoration(
              color:
              const Color(
                0xff00E5A8,
              ).withValues(
                alpha: .055,
              ),
              borderRadius:
              BorderRadius.circular(
                15,
              ),
              border:
              Border.all(
                color:
                const Color(
                  0xff00E5A8,
                ).withValues(
                  alpha: .12,
                ),
              ),
            ),
            child:
            const Row(
              children: [
                Icon(
                  Icons
                      .check_circle_outline_rounded,
                  color:
                  Color(
                    0xff00E5A8,
                  ),
                  size: 18,
                ),
                SizedBox(
                  width: 9,
                ),
                Expanded(
                  child:
                  Text(
                    'No suspicious activity found. All security checks passed.',
                    style:
                    TextStyle(
                      color:
                      Colors.white70,
                      fontSize: 9,
                      fontWeight:
                      FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          // ----------------------------------------------------------
          // AUTO SCAN AGAIN
          // ----------------------------------------------------------

          GestureDetector(
            onTap:
            _startNewScan,
            child:
            Container(
              width:
              double.infinity,
              height: 46,
              decoration:
              BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                  15,
                ),
                gradient:
                const LinearGradient(
                  colors: [
                    Color(
                      0xff00E5A8,
                    ),
                    Color(
                      0xff00B8FF,
                    ),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color:
                    const Color(
                      0xff00E5A8,
                    ).withValues(
                      alpha: .18,
                    ),
                    blurRadius:
                    18,
                  ),
                ],
              ),
              child:
              const Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                children: [
                  Icon(
                    Icons
                        .refresh_rounded,
                    color:
                    Colors.white,
                    size: 18,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'SCAN AGAIN',
                    style:
                    TextStyle(
                      color:
                      Colors.white,
                      fontSize: 10,
                      fontWeight:
                      FontWeight.w900,
                      letterSpacing:
                      1.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resultItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 72,
      decoration:
      BoxDecoration(
        color:
        Colors.white.withValues(
          alpha: .035,
        ),
        borderRadius:
        BorderRadius.circular(
          15,
        ),
        border: Border.all(
          color:
          const Color(
            0xff00E5A8,
          ).withValues(
            alpha: .10,
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
            const Color(
              0xff00E5A8,
            ),
            size: 17,
          ),

          const SizedBox(
            height: 4,
          ),

          Text(
            title,
            style:
            const TextStyle(
              color:
              Colors.white,
              fontSize: 15,
              fontWeight:
              FontWeight.w900,
            ),
          ),

          const SizedBox(
            height: 2,
          ),

          Text(
            subtitle,
            style:
            const TextStyle(
              color:
              Colors.white38,
              fontSize: 5.5,
              fontWeight:
              FontWeight.w800,
              letterSpacing: .6,
            ),
          ),
        ],
      ),
    );
  }

  // ================================================================
  // ACTION BUTTONS
  // ==============================================================

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: _actionButton(
            icon:
            Icons.history_rounded,
            text: 'HISTORY',
          ),
        ),

        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: _actionButton(
            icon:
            Icons.settings_rounded,
            text: 'SETTINGS',
          ),
        ),

        const SizedBox(
          width: 8,
        ),

        Expanded(
          child: _actionButton(
            icon: Icons
                .file_download_outlined,
            text: 'REPORT',
          ),
        ),
      ],
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String text,
  }) {
    return Container(
      height: 38,
      decoration:
      BoxDecoration(
        color:
        Colors.white.withValues(
          alpha: .035,
        ),
        borderRadius:
        BorderRadius.circular(
          13,
        ),
        border: Border.all(
          color:
          Colors.white.withValues(
            alpha: .055,
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
            Colors.white54,
            size: 14,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            text,
            style:
            const TextStyle(
              color:
              Colors.white38,
              fontSize: 6,
              fontWeight:
              FontWeight.w800,
              letterSpacing: .7,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    scanController.dispose();
    radarController.dispose();
    pulseController.dispose();

    super.dispose();
  }
}

// ==================================================================
// RADAR GRID
// ==================================================================

class _RadarGridPainter
    extends CustomPainter {
  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final paint = Paint()
      ..style =
          PaintingStyle.stroke
      ..strokeWidth = 1
      ..color =
      const Color(
        0xff00E5A8,
      ).withValues(
        alpha: .11,
      );

    // Rings
    for (double radius = 30;
    radius <= 85;
    radius += 27) {
      canvas.drawCircle(
        center,
        radius,
        paint,
      );
    }

    // Vertical line
    canvas.drawLine(
      Offset(
        center.dx,
        0,
      ),
      Offset(
        center.dx,
        size.height,
      ),
      paint,
    );

    // Horizontal line
    canvas.drawLine(
      Offset(
        0,
        center.dy,
      ),
      Offset(
        size.width,
        center.dy,
      ),
      paint,
    );

    // Diagonal line
    canvas.drawLine(
      const Offset(
        15,
        15,
      ),
      Offset(
        size.width - 15,
        size.height - 15,
      ),
      paint,
    );

    canvas.drawLine(
      Offset(
        size.width - 15,
        15,
      ),
      Offset(
        15,
        size.height - 15,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate,
      ) {
    return false;
  }
}

// ==================================================================
// RADAR BEAM
// ==================================================================

class _RadarBeamPainter
    extends CustomPainter {
  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final center = Offset(
      size.width / 2,
      size.height / 2,
    );

    final rect =
    Rect.fromCircle(
      center: center,
      radius:
      size.width / 2,
    );

    final gradient =
    SweepGradient(
      startAngle: -pi / 2,
      endAngle: pi / 2,
      colors: [
        const Color(
          0xff00E5A8,
        ).withValues(
          alpha: .34,
        ),
        const Color(
          0xff00E5A8,
        ).withValues(
          alpha: .08,
        ),
        Colors.transparent,
      ],
    );

    final paint = Paint()
      ..shader =
      gradient.createShader(
        rect,
      );

    canvas.drawArc(
      rect,
      -pi / 2,
      pi / 2,
      true,
      paint,
    );

    final linePaint = Paint()
      ..color =
      const Color(
        0xff00E5A8,
      ).withValues(
        alpha: .70,
      )
      ..strokeWidth = 2;

    canvas.drawLine(
      center,
      Offset(
        center.dx,
        0,
      ),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate,
      ) {
    return false;
  }
}