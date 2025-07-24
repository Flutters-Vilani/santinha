import 'package:santinha/views/login.dart';
import 'package:flutter/material.dart';

class BotaoPreLogin extends StatelessWidget {
  IconData icon;
  String text;
  Color textColor;
  Color buttonColor;
  Color iconColor;

  BotaoPreLogin(
      this.icon, this.text, this.textColor, this.buttonColor, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Login()));
      },
      child: Card(
        child: Container(
          // padding: EdgeInsets.all(30),
          width: MediaQuery.of(context).size.width * 0.3,
          height: 95,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
