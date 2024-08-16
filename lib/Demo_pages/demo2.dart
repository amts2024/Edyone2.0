// SizedBox(height: 10),
// Positioned(
// top: 971, // Position from top
// left: 40, // Position from left
// child: Container(
// width: double.infinity, // Expand to fit the content
// height: 22, // Fixed height
// decoration: BoxDecoration(
// color: Colors.transparent.withOpacity(0), // Transparent background with 0 opacity
// ),
// padding: const EdgeInsets.only(left: 20), // Padding for the paragraph
// child: Text(
// 'This Course Includes', // Text content
// style: TextStyle(
// fontFamily: 'Poppins', // Font family
// fontSize: 18, // Font size
// fontWeight: FontWeight.w600, // Font weight
// height: 21.6 / 18, // Line height
// color: Colors.black, // Text color
// ),
// textAlign: TextAlign.left, // Text alignment
// ),
// ),
// ),
//
// SizedBox(height: 10),
// Positioned(
// top: 1005, // Adjust as needed
// left: 20, // 20px space from the left
// child: Column(
// children: [
// // First row
// Row(
// mainAxisAlignment: MainAxisAlignment.start, // Align items to the start
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20), // 20px padding from the left
// child: Container(
// width: 20, // Fixed width for the image
// height: 20, // Fixed height for the image
// decoration: BoxDecoration(
// color: Colors.transparent.withOpacity(0), // Transparent background for the image container
// ),
// child: Image.asset(
// 'icon/akar.png', // Replace with your first image path
// width: 20,
// height: 20,
// fit: BoxFit.cover, // Adjust image fit if needed
// ),
// ),
// ),
// SizedBox(width: 6), // Gap between image and text
// Container(
//
// height: 17, // Fixed height for the text
// child: Text(
// 'Live Classes', // First text
// style: TextStyle(
// fontFamily: 'Poppins', // Font family
// fontSize: 14, // Font size
// fontWeight: FontWeight.w500, // Font weight
// height: 16.8 / 14, // Line height
// ),
// textAlign: TextAlign.left, // Text alignment
// maxLines: 1, // Ensure single line of text
// overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
// ),
// ),
// ],
// ),
// SizedBox(height: 8), // Space between rows
//
// // Second row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your second image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'MCQs', // Second text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
// SizedBox(height: 8),
//
// // Repeat similar structure for the third, fourth, fifth, sixth, and seventh rows
// // Third row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your third image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'Record Classes', // Third text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
// SizedBox(height: 8),
//
// // Fourth row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your fourth image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'More 140 Downloadable Resources', // Fourth text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
// SizedBox(height: 8),
//
// // Fifth row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your fifth image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'Mock Tests', // Fifth text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
// SizedBox(height: 8),
//
// // Sixth row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your sixth image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'Certificate of completion', // Sixth text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
// SizedBox(height: 8),
//
// // Seventh row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your seventh image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'Live Doubts Solution', // Seventh text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
//
// SizedBox(height: 8),
//
// // Seventh row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your seventh image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'Access on mobile and TV', // Seventh text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
//
// SizedBox(height: 8),
//
// // Seventh row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your seventh image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'DPP Sheets', // Seventh text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
//
// SizedBox(height: 8),
//
// // Seventh row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your seventh image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'lifetime access', // Seventh text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
//
// SizedBox(height: 8),
//
// // Seventh row
// Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.only(left: 20),
// child: Container(
// width: 20,
// height: 20,
// child: Image.asset(
// 'icon/akar.png', // Replace with your seventh image path
// width: 20,
// height: 20,
// fit: BoxFit.cover,
// ),
// ),
// ),
// SizedBox(width: 6),
// Container(
//
// height: 17,
// child: Text(
// 'Notes', // Seventh text
// style: TextStyle(
// fontFamily: 'Poppins',
// fontSize: 14,
// fontWeight: FontWeight.w500,
// height: 16.8 / 14,
// ),
// textAlign: TextAlign.left,
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
//
// ],
// ),
// ),
// Coursecontent(),
//
// Instructor(),
//
// CourseReview(),
//
// Faqs(),
//
// SizedBox(height: 10),
//
// Positioned(
// top: 633, // Position from top
// left: 20, // Position from left
// child: Container(
// width: 388, // Fixed width
// height: 40, // Fixed height (hug)
// decoration: BoxDecoration(
// color: Colors.transparent, // Transparent background
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the price label and button
// children: [
// // Container for price
// Container(
// width: 93, // Fixed width
// height: 24, // Fixed height
// margin: EdgeInsets.only(left: 16), // Margin from the left side
// child: Center(
// child: Text(
// '₹ 1200.00', // Price text
// style: TextStyle(
// fontFamily: 'Poppins', // Font family
// fontSize: 20, // Font size
// fontWeight: FontWeight.w700, // Font weight 700
// height: 24 / 20, // Line height calculated as height/size
// color: Colors.black, // Text color
// letterSpacing: 0, // Letter spacing
// ),
// textAlign: TextAlign.left, // Text alignment
// ),
// ),
// ),
// // Container for image
// Container(
// width: 40, // Fixed width
// height: 40, // Fixed height
// margin: EdgeInsets.only(left: 100), // Margin from the left side
// padding: const EdgeInsets.only(top: 8.75), // Padding around the image
// child: ClipRRect(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(5),
// bottomLeft: Radius.circular(5),
// ),
// child: Image.asset(
// 'icon/Frame.png', // Path to your image asset
// width: 40, // Image width
// height: 40, // Image height
// ),
// ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(5),
// bottomLeft: Radius.circular(5),
// ),
// ),
// ),
// // Gradient Button Container
// Container(
// width: 125, // Fixed width
// height: 40, // Fixed height
// margin: EdgeInsets.only(right: 10), // Margin from the right side
// padding: EdgeInsets.fromLTRB(24.25, 10, 23.75, 9), // Padding for the button
// child: ElevatedButton(
// onPressed: () {
// // Add your onPressed code here
// },
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.transparent, // Transparent background
// shadowColor: Colors.transparent, // Remove shadow
// elevation: 0, // Remove elevation
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.all(Radius.circular(5)), // Border radius
// ),
// padding: EdgeInsets.zero, // Remove padding
// ),
// child: Center(
// child: Text(
// 'Button', // Button text
// style: TextStyle(
// fontFamily: 'DM Sans', // Font family
// fontWeight: FontWeight.w500, // Font weight
// fontSize: 14, // Font size
// color: Colors.white, // Text color
// ),
// ),
// ),
// ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(5)),
// gradient: LinearGradient(
// colors: [Color(0xFFA10048), Color(0xFF2300FF)], // Gradient colors
// stops: [0.0, 1.0], // Gradient stops
// ),
// ),
// ),
// ],
// ),
// ),
// ),
