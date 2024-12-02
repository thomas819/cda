import 'package:cda/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ChatPage extends StatelessWidget {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (chatController) {
        return Scaffold(
          appBar: AppBar(title: Text('Chat')),
          body: Column(
            children: [
              // 채팅 메시지 표시 영역
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: chatController.isLoading.value
                        ? chatController.messages.length + 1
                        : chatController.messages.length,
                    itemBuilder: (context, index) {
                      if (chatController.isLoading.value &&
                          index == chatController.messages.length) {
                        // 로딩 애니메이션 (타이핑 효과)
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              chatController.typingIndicator.value,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      }
                      final message = chatController.messages[index];
                      return Align(
                        alignment: message.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: message.isUser
                                ? AppColors.primaryColor
                                : Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: message.isUser
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              // 입력 필드와 전송 버튼
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: '메시지를 입력하세요',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send, color: AppColors.primaryColor),
                      onPressed: () async {
                        if (textController.text.isNotEmpty) {
                          chatController.addMessage(textController.text, true);
                          textController.clear();
                          await chatController.addSystemResponse();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
