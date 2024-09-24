import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  // Hàm để mở hộp thoại chọn tháng và năm
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 254, 221, 85), // Màu của header
              onPrimary: Colors.black, // Màu của text trên header
              onSurface: Colors.black, // Màu của text bên trong
            ),
            textButtonTheme: TextButtonThemeData(

            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sổ Thu Chi', style: TextStyle(color: Colors.black)),
        backgroundColor: Color.fromARGB(255, 254, 221, 85),
        leading: IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Thêm tháng và năm bên cạnh phần chi phí
          Container(
            color: Color.fromARGB(255, 254, 221, 85),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Thêm cột tháng và năm với khả năng click để chọn tháng
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _selectDate(context); // Chọn tháng và năm
                      },
                      child: Column(
                        children: [
                          Text("Tháng",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text("${selectedDate.month}/${selectedDate.year}",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 24)),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text("Chi phí", style: TextStyle(color: Colors.black)),
                    Text("2.640.000", style: TextStyle(color: Colors.black)),
                  ],
                ),
                Column(
                  children: [
                    Text("Thu nhập", style: TextStyle(color: Colors.black)),
                    Text("5.000.000", style: TextStyle(color: Colors.black)),
                  ],
                ),
                Column(
                  children: [
                    Text("Số dư", style: TextStyle(color: Colors.black)),
                    Text("2.360.000", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                listItem('Tiền nhà', '-1.000.000', Icons.home),
                listItem('Lương', '5.000.000', Icons.monetization_on),
                listItem('Mua khoá học', '-1.500.000', Icons.book),
                listItem('Gói mạng', '-90.000', Icons.wifi),
                listItem('Mua đồ ăn', '-50.000', Icons.fastfood),
              ],
            ),
          ),
          // Nút quay về tháng trước
         Padding(
  padding: const EdgeInsets.all(16.0),
  child: ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 254, 221, 85), // Đổi 'primary' thành 'backgroundColor'
    ),
    onPressed: () {
      setState(() {
        selectedDate = DateTime(
          selectedDate.year,
          selectedDate.month - 1,
        );
      });
    },
    icon: Icon(Icons.arrow_back, color: Colors.black),
    label: Text("Tháng trước", style: TextStyle(color: Colors.black)),
  ),
),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 254, 221, 85),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Color.fromARGB(255, 254, 221, 85),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Biểu đồ'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Báo cáo'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tôi'),
        ],
      ),
    );
  }

  Widget listItem(String title, String amount, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: Text(amount, style: TextStyle(color: Colors.black)),
    );
  }
}
