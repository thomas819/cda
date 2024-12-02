import 'package:get/get.dart';

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  var isLoading = false.obs;
  var typingIndicator = ''.obs;

  final List<String> predefinedResponses = [
    "안녕하세요! 무엇을 도와드릴까요?",
    "이 전시는 매일 오전 10시부터 오후 6시까지 열립니다.",
    "더 궁금한 점이 있으신가요?",
    "감사합니다! 좋은 하루 되세요!"
  ];
  int responseIndex = 0;

  void addMessage(String text, bool isUser) {
    messages.add(Message(text: text, isUser: isUser));
  }

  Future<void> addSystemResponse() async {
    if (responseIndex < predefinedResponses.length) {
      isLoading.value = true; // 로딩 상태 시작
      _startTypingIndicator(); // 애니메이션 시작

      await Future.delayed(Duration(seconds: 2)); // 응답 지연
      isLoading.value = false; // 로딩 상태 종료
      typingIndicator.value = ''; // 애니메이션 초기화
      addMessage(predefinedResponses[responseIndex], false);
      responseIndex++;
    }
  }

  void _startTypingIndicator() async {
    const typingStages = ['.', '..', '...']; // 애니메이션 단계
    int stage = 0;

    while (isLoading.value) {
      typingIndicator.value = typingStages[stage % typingStages.length];
      stage++;
      await Future.delayed(Duration(milliseconds: 500)); // 단계별 지연
    }

    typingIndicator.value = ''; // 로딩 종료 시 초기화
  }
}
