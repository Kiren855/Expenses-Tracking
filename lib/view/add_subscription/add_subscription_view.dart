import 'package:flutter/material.dart';
import 'package:trackizer/common/color_extension.dart';
import 'package:trackizer/model/category.dart';
import 'package:trackizer/service/category.dart';

int selectedIndex = -1; // Chỉ mục được chọn hiện tại

const List<String> chartType = <String>['Chi phí', 'Thu nhập'];

String selectTab = 'expense';

final List<Map<String, dynamic>> expenseItems = [
  {"icon": "assets/img/shopping-cart.png", "name": "Mua sắm"},
  {"icon": "assets/img/restaurant.png", "name": "Đồ ăn"},
  {"icon": "assets/img/smartphone.png", "name": "Điện thoại"},
  {"icon": "assets/img/micro.png", "name": "Giải trí"},
  {"icon": "assets/img/book.png", "name": "Giáo dục"},
  {"icon": "assets/img/cosmetics.png", "name": "Sắc đẹp"},
  {"icon": "assets/img/swimming.png", "name": "Thể thao"},
  {"icon": "assets/img/people.png", "name": "Xã hội"},
  {"icon": "assets/img/delivery-truck.png", "name": "Vận tải"},
  {"icon": "assets/img/tshirt.png", "name": "Quần áo"},
  {"icon": "assets/img/transport.png", "name": "Xe hơi"},
  {"icon": "assets/img/wine-glasses.png", "name": "Rượu"},
  {"icon": "assets/img/box.png", "name": "Thuốc lá"},
  {"icon": "assets/img/game-controller.png", "name": "Thiết bị điện"},
  {"icon": "assets/img/airplane.png", "name": "Du lịch"},
  {"icon": "assets/img/healthy.png", "name": "Sức khỏe"},
  {"icon": "assets/img/pet.png", "name": "Thú cưng"},
  {"icon": "assets/img/repair.png", "name": "Sửa chữa"},
  {"icon": "assets/img/paint-roller.png", "name": "Nhà ở"},
  {"icon": "assets/img/home.png", "name": "Nhà"},
  {"icon": "assets/img/gift-card.png", "name": "Qùa tặng"},
  {"icon": "assets/img/give-money.png", "name": "Quyên góp"},
  {"icon": "assets/img/fortune-wheel.png", "name": "Vé số"},
  {"icon": "assets/img/fast-food.png", "name": "Đồ ăn nhẹ"},
  {"icon": "assets/img/playtime.png", "name": "Trẻ em"},
  {"icon": "assets/img/vegetable.png", "name": "Rau qủa"},
  {"icon": "assets/img/orange.png", "name": "Hoa qủa"},
  {"icon": "assets/img/plus.png", "name": "Cài đặt"},
  {"icon": "assets/img/money_1.png", "name": "Lương"},
  {"icon": "assets/img/salary.png", "name": "Đầu tư"},
  {"icon": "assets/img/back-in-time.png", "name": "Làm thêm"},
  {"icon": "assets/img/money.png", "name": "Giải thưởng"},
  {"icon": "assets/img/application.png", "name": "Khác"},
  {"icon": "assets/img/plus.png", "name": "Cài đặt"},
];

class AddSubScriptionView extends StatefulWidget {
  const AddSubScriptionView({super.key});

  @override
  State<AddSubScriptionView> createState() => _AddSubScriptionViewState();
}

class _AddSubScriptionViewState extends State<AddSubScriptionView> {
  List<Category> categories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCategory();
  }

  void _getCategory() async {
    CategoryService categoryService = CategoryService();
    categories = await categoryService.getCategories();
    print(categories);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        children: [
          // Grid với 4 cột
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.185),
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
              ),
              // Lọc các mục dựa trên loại Expenses hoặc Income
              itemCount: categories
                  .where((category) =>
                      category.type ==
                      (selectTab == 'expense' ? 'Expenses' : 'Income'))
                  .length,
              itemBuilder: (context, index) {
                // Lọc danh sách categories dựa vào loại Expenses hoặc Income
                List<Category> filteredCategories = categories
                    .where((category) =>
                        category.type ==
                        (selectTab == 'expense' ? 'Expenses' : 'Income'))
                    .toList();

                var item = filteredCategories[index];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    _showNumberInputDialog(context, index);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.yellow
                              : Color(0xffe6e6e6),
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: SizedBox(
                            child: Image.asset(
                              item.icon,
                              width: 20.0,
                              height: 20.0,
                              color: selectedIndex == index
                                  ? const Color.fromARGB(255, 142, 142, 142)
                                  : Color.fromARGB(255, 154, 154, 154),
                              colorBlendMode: selectedIndex == index
                                  ? BlendMode.srcIn
                                  : BlendMode.modulate,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        item.name,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(255, 62, 62, 62),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: TColor.yellowHeader,
              height: MediaQuery.of(context).size.height * 0.165,
              child: Column(
                children: [
                  const SizedBox(
                      height: 40), // Khoảng cách giữa dropdown và các button
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0), // Padding trái phải 10px
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Căn đều các widget trong Row
                      children: [
                        // Text "Hủy" có gán sự kiện
                        GestureDetector(
                          onTap: () {
                            // Xử lý sự kiện khi nhấn vào "Hủy"
                            selectedIndex = -1;
                            Navigator.pop(context); // Quay lại màn hình trước
                          },
                          child: const Text(
                            'Hủy',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors
                                  .black, // Bạn có thể thay đổi màu nếu cần
                            ),
                          ),
                        ),

                        // Text "Thêm" ở giữa, font 15 bold
                        const Text(
                          'Thêm',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color:
                                Colors.black, // Bạn có thể thay đổi màu nếu cần
                          ),
                        ),

                        // Icon lịch
                        IconButton(
                          onPressed: () {
                            // Xử lý sự kiện khi nhấn vào icon lịch
                            print("Calendar icon tapped");
                          },
                          icon: const Icon(
                            Icons.calendar_today,
                            color:
                                Colors.black, // Bạn có thể thay đổi màu nếu cần
                          ),
                        ),
                      ],
                    ),
                  ),

                  //fixed header
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 6), // Thêm padding bottom 20px
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = -1;
                              selectTab = 'expense'; // Chọn nút "Chi phí"
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectTab == 'expense'
                                ? const Color.fromARGB(
                                    255, 5, 5, 5) // Nền đen khi được chọn
                                : const Color(
                                    0xffFFDA47), // Nền trong suốt khi không được chọn
                            side: BorderSide(
                              color: selectTab == 'expense'
                                  ? const Color.fromARGB(255, 5, 5, 5)
                                  : Colors.black,
                              width: 0.5,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7.0),
                                bottomLeft: Radius.circular(7.0),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 17.0,
                              horizontal: 57.0,
                            ),
                          ),
                          child: Text(
                            'Chi phí',
                            style: TextStyle(
                              fontSize: 15,
                              color: selectTab == 'expense'
                                  ? const Color.fromARGB(255, 254, 221,
                                      85) // Chữ vàng khi được chọn
                                  : Colors.black, // Chữ đen khi không được chọn
                            ),
                          ),
                        ),
                        const SizedBox(width: 0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedIndex = -1;
                              selectTab = 'income'; // Chọn nút "Thu nhập"
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: selectTab == 'income'
                                ? const Color.fromARGB(
                                    255, 5, 5, 5) // Nền đen khi được chọn
                                : const Color(
                                    0xffFFDA47), // Nền trong suốt khi không được chọn
                            side: BorderSide(
                              color: selectTab == 'income'
                                  ? const Color.fromARGB(255, 5, 5, 5)
                                  : Colors.black,
                              width: 0.5,
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(7.0),
                                bottomRight: Radius.circular(7.0),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 17.0,
                              horizontal: 53.0,
                            ),
                          ),
                          child: Text(
                            'Thu nhập',
                            style: TextStyle(
                              fontSize: 15,
                              color: selectTab == 'income'
                                  ? const Color.fromARGB(255, 254, 221,
                                      85) // Chữ vàng khi được chọn
                                  : Colors.black, // Chữ đen khi không được chọn
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showNumberInputDialog(BuildContext context, int index) {
    TextEditingController amountController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true, // Cho phép modal mở rộng toàn màn hình nếu cần
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            setState(() {
              selectedIndex = -1; // Gán lại selectedIndex khi thoát modal
            });
          },
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // Lấy khoảng trống của bàn phím
            ),
            child: GestureDetector(
              onTap: () {}, // Để modal không bị đóng khi nhấn vào nội dung
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Nhập số tiền cho ${expenseItems[index]['name']}",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Số tiền'),
                        onSubmitted: (value) {
                          // Lưu giá trị sau khi nhập
                          setState(() {
                            expenseItems[index]['amount'] =
                                int.tryParse(value) ?? 0;
                          });
                          Navigator.pop(context); // Đóng modal
                          setState(() {
                            selectedIndex =
                                -1; // Gán lại selectedIndex khi thoát modal
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Lưu giá trị sau khi nhập
                          setState(() {
                            expenseItems[index]['amount'] =
                                int.tryParse(amountController.text) ?? 0;
                          });
                          Navigator.pop(context); // Đóng bàn phím số
                          setState(() {
                            selectedIndex =
                                -1; // Gán lại selectedIndex khi thoát modal
                          });
                        },
                        child: Text("Lưu"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      // Gán selectedIndex = -1 khi modal đóng, bao gồm cả khi nhấn ra ngoài
      setState(() {
        selectedIndex = -1;
      });
    });
  }
}
