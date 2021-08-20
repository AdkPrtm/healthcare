part of 'widgets.dart';

class CustomFieldWidget extends StatefulWidget {
  const CustomFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.margin = 16,
    this.controller2,
  }) : super(key: key);

  final TextEditingController controller;
  final TextEditingController? controller2;
  final String hint;
  final double margin;

  @override
  _CustomFieldWidgetState createState() => _CustomFieldWidgetState();
}

class _CustomFieldWidgetState extends State<CustomFieldWidget> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.margin),
      child: TextFormField(
        controller: widget.controller,
        obscureText:
            widget.hint == 'Password' || widget.hint == 'Confirm Password'
                ? _showPassword
                : false,
        style: textStyle.copyWith(
          fontSize: 16,
          fontWeight: medium,
          color: kPrimaryColor1,
        ),
        cursorColor: kPrimaryColor1,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: textStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
            color: kPrimaryColor3,
          ),
          suffixIcon:
              widget.hint == 'Password' || widget.hint == 'Confirm Password'
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      child: Icon(
                        _showPassword ? Icons.visibility_off : Icons.visibility,
                        color: kPrimaryColor4,
                      ),
                    )
                  : SizedBox(),
          suffixIconConstraints:
              widget.hint == 'Password' || widget.hint == 'Confirm Password'
                  ? BoxConstraints(
                      minWidth: 40,
                      minHeight: 24,
                    )
                  : BoxConstraints(),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: kPrimaryColor6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: kPrimaryColor1,
            ),
          ),
        ),
        validator: widget.hint == 'Email'
            ? (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your email address";
                } else if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              }
            : widget.hint == 'Password'
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    } else if (value.length <= 8) {
                      return "Minimum length password 8";
                    }
                    return null;
                  }
                : widget.hint == 'Confirm Password'
                    ? (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length <= 8) {
                          return "Minimum length password 8";
                        } else if (value != widget.controller2!.text) {
                          return "Password should match password";
                        }
                        return null;
                      }
                    : (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name";
                        }
                      },
      ),
    );
  }
}
