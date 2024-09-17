import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 254, 221, 85),
        elevation: 0,
        toolbarHeight: 0, // Ẩn thanh công cụ (toolbar)
      ),
      body: Column(
        children: [
          // Phần header thông tin người dùng
          Container(
            color: const Color.fromARGB(255, 254, 221, 85),
            padding: const EdgeInsets.all(16),
            child: const Row(
              children: [
                // Ảnh đại diện
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/img/avatar.png'), // Đường dẫn ảnh đại diện của bạn
                  radius: 30,
                ),
                SizedBox(width: 16),
                // Thông tin tên và ID người dùng
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chuyển Sinh Chan',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'ID: 834145',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Danh sách các mục
          Expanded(
            child: ListView(
              children: [
                buildMenuItem(
                  icon: Icons.star, // Thay thế bằng biểu tượng hợp lệ
                  text: 'Thành viên Premium',
                  iconColor: Colors.orange,
                ),
                buildMenuItem(
                  icon: Icons.thumb_up_alt_outlined,
                  text: 'Giới thiệu cho bạn bè',
                  iconColor: Colors.yellow[
                      700]!, // Thêm dấu ! để chỉ định giá trị không null
                ),
                buildMenuItem(
                  icon: Icons.rate_review_outlined,
                  text: 'Đánh giá ứng dụng',
                  iconColor: Colors.orange,
                ),
                buildMenuItem(
                  icon: Icons.block,
                  text: 'Chặn quảng cáo',
                  iconColor: Colors.orange,
                ),
                buildMenuItem(
                  icon: Icons.settings_outlined,
                  text: 'Cài đặt',
                  iconColor: Colors.orange,
                ),
                Divider(), // Thêm ngăn cách giữa các mục
                // Mục Đăng xuất
                buildMenuItem(
                  icon: Icons.logout,
                  text: 'Đăng xuất',
                  iconColor: Colors.red, // Màu đỏ cho mục Đăng xuất
                ),
              ],
            ),
          ),
          // Thanh điều hướng dưới
          BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.yellow[700], // Màu khi mục được chọn
            unselectedItemColor: Colors.black54, // Màu khi mục không được chọn
            currentIndex: 4, // Tab hiện tại
            onTap: (index) {},
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Trang chủ',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Biểu đồ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle,
                    size: 40, color: Colors.yellow[700]!),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.report),
                label: 'Báo cáo',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Tôi',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Hàm để xây dựng một mục trong danh sách
  Widget buildMenuItem(
      {required IconData icon,
      required String text,
      required Color iconColor}) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor,
      ),
      title: Text(text),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      onTap: () {
        // Thêm chức năng khi nhấn vào mục
        if (text == 'Đăng xuất') {
          // Xử lý đăng xuất
        }
      },
    );
  }
}
