import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // 앱 이름에 따라 경로를 변경하세요

void main() {
  testWidgets('To-Do List: Add Task', (WidgetTester tester) async {
    // 앱 위젯 로드
    await tester.pumpWidget(MyApp());

    // 확인: TextField와 추가 버튼 존재
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);

    // 새 작업 입력
    await tester.enterText(find.byType(TextField), 'Test Task 1');
    await tester.tap(find.text('Add'));

    // UI 업데이트
    await tester.pump();

    // 새 작업이 리스트에 추가되었는지 확인
    expect(find.text('Test Task 1'), findsOneWidget);
  });

  testWidgets('To-Do List: Add Multiple Tasks', (WidgetTester tester) async {
    // 앱 위젯 로드
    await tester.pumpWidget(MyApp());

    // 첫 번째 작업 입력
    await tester.enterText(find.byType(TextField), 'Test Task 1');
    await tester.tap(find.text('Add'));

    // UI 업데이트
    await tester.pump();

    // 두 번째 작업 입력
    await tester.enterText(find.byType(TextField), 'Test Task 2');
    await tester.tap(find.text('Add'));

    // UI 업데이트
    await tester.pump();

    // 두 작업이 리스트에 추가되었는지 확인
    expect(find.text('Test Task 1'), findsOneWidget);
    expect(find.text('Test Task 2'), findsOneWidget);
  });

  testWidgets('To-Do List: Remove Task', (WidgetTester tester) async {
    // 앱 위젯 로드
    await tester.pumpWidget(MyApp());

    // 새 작업 입력
    await tester.enterText(find.byType(TextField), 'Test Task 1');
    await tester.tap(find.text('Add'));

    // UI 업데이트
    await tester.pump();

    // 새 작업이 리스트에 추가되었는지 확인
    expect(find.text('Test Task 1'), findsOneWidget);

    // 작업 삭제
    await tester.tap(find.byIcon(Icons.delete).first);

    // UI 업데이트
    await tester.pump();

    // 작업이 리스트에서 삭제되었는지 확인
    expect(find.text('Test Task 1'), findsNothing);
  });

  // testWidgets('To-Do List: Add Task using Enter key (should fail)', (WidgetTester tester) async {
  //   // 앱 위젯 로드
  //   await tester.pumpWidget(MyApp());

  //   // TextField와 추가 버튼 확인
  //   expect(find.byType(TextField), findsOneWidget);

  //   // 새 작업 입력
  //   await tester.enterText(find.byType(TextField), 'Test Task with Enter');

  //   // 키보드 Enter 키 시뮬레이션 (onSubmitted이 구현되지 않았으므로 아무 동작도 없음)
  //   await tester.testTextInput.receiveAction(TextInputAction.done);

  //   // UI 업데이트
  //   await tester.pump();

  //   // 새 작업이 리스트에 추가되지 않았는지 확인
  //   expect(find.text('Test Task with Enter'), findsNothing);
  // });
}
