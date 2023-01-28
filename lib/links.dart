import 'package:url_launcher/url_launcher.dart';

_launchURLApp() async {
  var url = Uri.parse("https://www.geeksforgeeks.org/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
Future<void> _launchURL (String url) async{
  final Uri uri = Uri (scheme:"https", host: url);
  if(!await launchUrl( uri, mode: LaunchMode.externalApplication,))
  {throw "Can not launch url";}

}