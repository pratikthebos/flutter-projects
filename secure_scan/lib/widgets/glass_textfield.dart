import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/app_colors.dart';

class GlassTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final ValueChanged<String>? onChanged;

  const GlassTextField({
    super.key,
    required this.controller,
    this.hint = "https://example.com",
    this.onChanged,
  });

  @override
  State<GlassTextField> createState() => _GlassTextFieldState();
}

class _GlassTextFieldState extends State<GlassTextField> {
  final FocusNode _focusNode = FocusNode();

  bool _focused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _pasteUrl() async {
    final data = await Clipboard.getData('text/plain');

    if (data?.text != null) {
      widget.controller.text = data!.text!;
      widget.onChanged?.call(widget.controller.text);
      setState(() {});
    }
  }

  bool get _isValidUrl {
    final text = widget.controller.text.trim();

    if (text.isEmpty) return false;

    final uri = Uri.tryParse(text);

    return uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white.withOpacity(.08),
        border: Border.all(
          color: _focused
              ? AppColors.primary
              : AppColors.glassBorder,
          width: _focused ? 2 : 1,
        ),
        boxShadow: _focused
            ? [
          BoxShadow(
            color: AppColors.primary.withOpacity(.25),
            blurRadius: 25,
            spreadRadius: 1,
          )
        ]
            : [],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: TextInputType.url,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        cursorColor: AppColors.primary,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),

          hintText: widget.hint,

          hintStyle: const TextStyle(
            color: Colors.white54,
          ),

          prefixIcon: const Icon(
            Icons.language_rounded,
            color: Colors.white70,
          ),

          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              IconButton(
                tooltip: "Paste",
                onPressed: _pasteUrl,
                icon: const Icon(
                  Icons.content_paste_rounded,
                  color: Colors.white70,
                ),
              ),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _isValidUrl
                    ? const Padding(
                  key: ValueKey("valid"),
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.verified_rounded,
                    color: Colors.greenAccent,
                  ),
                )
                    : const SizedBox(
                  key: ValueKey("empty"),
                  width: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}