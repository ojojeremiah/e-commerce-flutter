import 'package:cartify/controller/switch.dart';
import 'package:cartify/utils/provider/app_provider.dart';
import 'package:cartify/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SwitchX sx = Get.put(SwitchX());
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Stack(
            children: [
              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(45)),
                  ),
                  child: const Icon(Icons.image)),
              Container(
                  height: 35,
                  decoration: const BoxDecoration(
                      color: AppColors.brandColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  margin: const EdgeInsets.only(top: 60, left: 22),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.lightCardColor,
                        size: 20,
                      ),
                    ),
                  ))
            ],
          )),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.edit,
                size: 20,
                color: AppColors.brandColor,
              ),
              title: Text(
                "Edit Profile",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.notifications_active_outlined,
                size: 20,
                color: AppColors.brandColor,
              ),
              title: Text(
                "Notification Setting",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.shopping_cart,
                size: 20,
                color: AppColors.brandColor,
              ),
              title: Text(
                "Shiping Address",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.payment_outlined,
                size: 20,
                color: AppColors.brandColor,
              ),
              title: Text(
                "Payment Info",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(
                Icons.delete_outline,
                size: 20,
                color: AppColors.brandColor,
              ),
              title: Text(
                "Delete Account",
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              child: const Text(
                "App Settings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          ListTile(
            title: const Text(
              "Enable Face ID for Login",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Obx(
              () => Switch(
                  activeColor: AppColors.brandColor,
                  value: sx.on.value,
                  onChanged: (val) {
                    sx.face();
                  }),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          ListTile(
            title: const Text(
              "Enable Location Services",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Obx(
              () => Switch(
                  activeColor: AppColors.brandColor,
                  value: sx.active.value,
                  onChanged: (val) {
                    sx.location();
                  }),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          ListTile(
            title: const Text(
              "Dark mode",
              style: TextStyle(fontSize: 15),
            ),
            trailing: Obx(
              () => Switch(
                  activeColor: AppColors.brandColor,
                  value: sx.modes.value,
                  onChanged: (val) {
                    bool isDarkTheme = themeProvider.isDarkMode;
                    final provider =
                        Provider.of<AppThemeProvider>(context, listen: false);
                    provider.toggleTheme(!isDarkTheme);
                    sx.mode();
                  }),
            ),
          ),
          Divider(
            height: 1,
            thickness: 2,
            color: Colors.grey[300],
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.logout,
                      size: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text("Log out"),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
