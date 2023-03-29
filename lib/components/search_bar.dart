import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto/config/config.dart' as CONFIG;

class SearchBar extends StatefulWidget {
  final double width;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String helpText;
  final int animationDurationInMilli;
  final Function(String searchText) onSearch;
  final bool rtl;
  final bool autoFocus;
  final TextStyle? style;
  final bool closeSearchOnSuffixTap;
  final Color? color;
  final List<TextInputFormatter>? inputFormatters;

  const SearchBar({
    Key? key,

    /// The width cannot be null
    required this.width,
    this.suffixIcon,
    this.prefixIcon,
    this.helpText = "Type to search...",

    /// choose your custom color
    this.color = Colors.transparent,

    /// The onSuffixTap cannot be null
    required this.onSearch,
    this.animationDurationInMilli = 375,

    /// make the search bar to open from right to left
    this.rtl = false,

    /// make the keyboard to show automatically when the searchbar is expanded
    this.autoFocus = false,

    /// TextStyle of the contents inside the searchbar
    this.style,

    /// close the search on suffix tap
    this.closeSearchOnSuffixTap = false,

    /// can add list of inputformatters to control the input
    this.inputFormatters,
  }) : super(key: key);

  @override
  SearchBarState createState() => SearchBarState();
}

///toggle - 0 => false or closed
///toggle 1 => true or open
int toggle = 0;

class SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  ///initializing the AnimationController
  late AnimationController _con;
  FocusNode focusNode = FocusNode();
  TextEditingController textController= new TextEditingController();

  @override
  void initState() {
    super.initState();

    ///Initializing the animationController which is responsible for the expanding and shrinking of the search bar
    _con = AnimationController(
      vsync: this,

      /// animationDurationInMilli is optional, the default value is 375
      duration: Duration(milliseconds: widget.animationDurationInMilli),
    );
  }

  unfocusKeyboard() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,

      ///if the rtl is true, search bar will be from right to left
      alignment: widget.rtl ? Alignment.centerRight : Alignment(-1.0, 0.0),

      ///Using Animated container to expand and shrink the widget
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.animationDurationInMilli),
        height: 40.0,
        width: (toggle == 0) ? 40.0 : widget.width,
        curve: Curves.easeOut,
        //alignment: toggle == 1?Alignment.:Alignment.center,
        decoration: BoxDecoration(
          /// can add custom color or the color will be white
          color: widget.color,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: (toggle == 0) ?Colors.transparent:Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              spreadRadius: -10.0,
              blurRadius: 1.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Stack(
          children: [
            ///Using Animated Positioned widget to expand and shrink the widget
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              top: 3.0,
              right: 7.0,
              curve: Curves.easeOut,
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: Duration(milliseconds: 200),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    /// can add custom color or the color will be white
                    color: widget.color,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: AnimatedBuilder(
                    child: GestureDetector(
                      onTap: () {
                        try {
                          ///trying to execute the onSuffixTap function
                          ///closeSearchOnSuffixTap will execute if it's true
                          textController.text='';
                          if (widget.closeSearchOnSuffixTap) {
                            unfocusKeyboard();
                            setState(() {
                              toggle = 0;
                            });
                          }
                        } catch (e) {
                          ///print the error if the try block fails
                          print(e);
                        }
                        widget.onSearch(textController.text);
                      },

                      ///suffixIcon is of type Icon
                      child: widget.suffixIcon != null
                          ? widget.suffixIcon
                          : Icon(
                        FontAwesomeIcons.trashCan,
                        size: 16.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                    builder: (context, widget) {
                      ///Using Transform.rotate to rotate the suffix icon when it gets expanded
                      return Transform.rotate(
                        angle: _con.value * 2.0 * pi,
                        child: widget,
                      );
                    },
                    animation: _con,
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDurationInMilli),
              left: (toggle == 0) ? 20.0 : 40.0,
              curve: Curves.easeOut,
              top: 6.0,

              ///Using Animated opacity to change the opacity of th textField while expanding
              child: AnimatedOpacity(
                opacity: (toggle == 0) ? 0.0 : 1.0,
                duration: Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.only(left: 10, top: 0),
                  alignment: Alignment.topCenter,
                  width: widget.width / 1.7,
                  child: TextField(
                    ///Text Controller. you can manipulate the text inside this textField by calling this controller.
                    controller: textController,
                    inputFormatters: widget.inputFormatters,
                    focusNode: focusNode,
                    cursorRadius: Radius.circular(10.0),
                    cursorWidth: 2.0,
                    onChanged: (text)=>widget.onSearch(text),
                    onEditingComplete: () {
                      print("text adding done");
                      /// on editing complete the keyboard will be closed and the search bar will be closed
                      unfocusKeyboard();
                      setState(() {
                        toggle = 0;
                      });
                    },

                    ///style is of type TextStyle, the default is just a color black
                    style: widget.style != null
                        ? widget.style
                        : TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      isDense: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelText: widget.helpText,
                      labelStyle: TextStyle(
                        color: Color(0xff5B5B5B),
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            ///Using material widget here to get the ripple effect on the prefix icon
            Material(
              /// can add custom color or the color will be white
              color: widget.color,
              //color:Colors.blue,
              borderRadius: BorderRadius.circular(30.0),
              child: Container(
                  width: 48,
                  alignment: Alignment.center,
                  child:AnimatedBuilder(
                    child: IconButton(
                      splashRadius: 19.0,

                      ///if toggle is 1, which means it's open. so show the back icon, which will close it.
                      ///if the toggle is 0, which means it's closed, so tapping on it will expand the widget.
                      ///prefixIcon is of type Icon
                      icon: widget.prefixIcon != null
                          ? toggle == 1
                          ? Icon(FontAwesomeIcons.xmark, color: CONFIG.primaryColor,)
                          : widget.prefixIcon!
                          : Icon(
                        toggle == 1 ? FontAwesomeIcons.xmark : Icons.search,
                        size: 20.0,
                        color: toggle == 1?CONFIG.primaryColor:Colors.black,
                      ),
                      onPressed: () {
                        setState(
                              () {
                            ///if the search bar is closed
                            if (toggle == 0) {
                              toggle = 1;
                              setState(() {
                                ///if the autoFocus is true, the keyboard will pop open, automatically
                                if (widget.autoFocus)
                                  FocusScope.of(context).requestFocus(focusNode);
                              });

                              ///forward == expand
                              _con.forward();
                            } else {
                              ///if the search bar is expanded
                              toggle = 0;

                              ///if the autoFocus is true, the keyboard will close, automatically
                              setState(() {
                                if (widget.autoFocus) unfocusKeyboard();
                              });

                              ///reverse == close
                              _con.reverse();
                            }
                          },
                        );
                      },
                    ),
                    builder: (context, widget) {
                      ///Using Transform.rotate to rotate the suffix icon when it gets expanded
                      return Transform.rotate(
                        angle: _con.value * 2.0 * pi,
                        child: widget,
                      );
                    },
                    animation: _con,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}