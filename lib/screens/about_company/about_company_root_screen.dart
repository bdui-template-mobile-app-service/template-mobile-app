import 'package:flutter/material.dart';
import 'package:graduate_work/models/about_company_info.dart';
import 'package:graduate_work/networking/api/api.dart';
import 'package:graduate_work/providers/colors_provider.dart';
import 'package:graduate_work/screens/about_company/components/logo_widget.dart';
import 'package:graduate_work/screens/settings/settings_root_screen.dart';
import 'package:graduate_work/widgets/standard/src/app_bar.dart';
import 'package:graduate_work/widgets/standard/src/scaffold.dart';
import 'package:graduate_work/widgets/standard/src/text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCompanyRootScreen extends StatefulWidget {
  const AboutCompanyRootScreen({Key? key}) : super(key: key);

  @override
  _AboutCompanyRootScreenState createState() => _AboutCompanyRootScreenState();
}

class _AboutCompanyRootScreenState extends State<AboutCompanyRootScreen> {
  @override
  Widget build(BuildContext context) {
    return StandardScaffold.standard(
        context: context,
        appBar: StandardAppBar.standard(
            context: context,
            title: const Text('Инфо'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                  child: const Icon(Icons.settings, size: 30),
                  onTap: () => _showSettings(context),
                ),
              ),
            ]),
        body: FutureBuilder<AboutCompanyInfo?>(
          future: fetchInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: StandardText('Ошибка загрузки'));
            }
            if (snapshot.data != null) {
              return _buildMainListView(snapshot.data!);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  void _showSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SettingsRootScreen()),
    );
  }

  Future<AboutCompanyInfo?> fetchInfo() async {
    try {
      final info = await RestClient.shared.fetchAboutCompanyInfo();
      return info;
    } catch (error) {
      return null;
    }
  }

  Widget _buildMainListView(AboutCompanyInfo info) => ListView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        children: [
          Align(
            alignment: Alignment.center,
            child: LogoWidget(logoUrl: info.logoImage),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: StandardText(
              info.name,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          const SizedBox(height: 16),
          StandardText(
            info.description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _build2gisLinkWidget(info.address, info.linkTo2gis),
              const Spacer(),
            ],
          ),
        ],
      );

  Widget _build2gisLinkWidget(String address, String linkTo2gis) =>
      GestureDetector(
        onTap: () => launchUrl(Uri.parse(linkTo2gis)),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: context.watch<ColorsProvider>().colorSet.color2Gis,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Row(
              children: [
                StandardText(
                  address,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  height: 25,
                  child: Image.asset(
                    'assets/2gis_logo.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
