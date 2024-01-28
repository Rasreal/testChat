import 'package:image_picker/image_picker.dart';

import '../model/chat_message_model.dart';

// void _pickImage(ImagePicker _imagePicker) async {
//   final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     final newMessage = Message(
//       userId: '777', // You can replace this with dynamic user ID
//       text: '',
//       timestamp: DateTime.now(),
//       image: File(pickedFile.path),
//     );
//
//     setState(() {
//       if (chatData.containsKey(widget.chatID)) {
//         chatData[widget.chatID]!.add(newMessage);
//       } else {
//         // Create a new chat if it doesn't exist
//         chatData[widget.chatID] = [newMessage];
//       }
//     });
//   }
// }
//
// void _sendMessage() {
//   final messageText = _messageController.text;
//   if (messageText.isNotEmpty) {
//     final newMessage = Message(
//       userId: 'User 1', // You can replace this with dynamic user ID
//       text: messageText,
//       timestamp: DateTime.now(),
//     );
//
//     setState(() {
//       if (chatData.containsKey(widget.chatID)) {
//         chatData[widget.chatID]!.add(newMessage);
//       } else {
//         // Create a new chat if it doesn't exist
//         chatData[widget.chatID] = [newMessage];
//       } // Insert at the beginning to maintain reverse order
//       _messageController.clear();
//     });
//   }
// }