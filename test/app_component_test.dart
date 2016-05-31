@TestOn('browser')
import 'package:test/test.dart';
import 'dart:html';
import 'package:angular2/platform/browser.dart';
import 'package:angular2_testing/angular2_testing.dart';
import 'package:angular2_testing_example/app_component.dart';

void main() {
  TestComponentBuilder builder;

  initAngularTests();

  setUpProviders(() => [TestComponentBuilder]);

  ngSetUp((TestComponentBuilder tcb) {
    builder = tcb;
  });

  ngTest('should apply class based on color attribute', () async {
    ComponentFixture fixture = await builder.createAsync(AppComponent);
    var h1DebugElement = fixture.debugElement.query(By.css('h1'));
    expect((h1DebugElement.nativeElement as Element).text,
        equals('My First Angular 2 App'));
  });

  ngTest('normal function', () {
    var string = 'foo,bar,baz';
    expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });
}
