import 'package:flutter/material.dart';

class LogoImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('images/logo.jpeg');
    Image imageLogo = Image(image: logo, width: 200,);
    return Container(
      child: imageLogo
    );
  }
}

class HgImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('images/hg.jpeg');
    Image imageLogo = Image(image: logo, width: 200, color: Colors.white.withOpacity(0.1),);
    return Container(
      child: imageLogo
    );
  }
}

class SVTImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('images/svt.jpeg');
    Image imageLogo = Image(image: logo, width: 200,);
    return Container(
      child: imageLogo
    );
  }
}

class MathsImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('images/maths.jpeg');
    Image imageLogo = Image(image: logo, width: 200,);
    return Container(
      child: imageLogo
    );
  }
}

class PcImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('images/pc.jpeg');
    Image imageLogo = Image(image: logo, width: 200,);
    return Container(
      child: imageLogo
    );
  }
}