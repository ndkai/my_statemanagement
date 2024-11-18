import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:fast_bloc_annotations/bloc_annotations.dart';

import 'package:source_gen/source_gen.dart';

import '../annotations/kaism.dart';
import '../helper/helper.dart';
import 'model_visitor.dart';


class KaismGenerator extends GeneratorForAnnotation<Kaism> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    final ModelVisitor visitor = ModelVisitor();
    element.visitChildren(visitor);


    final buffer = StringBuffer();
    String generateBlocS = generateKaism(visitor);
    String generateEventS = generateEvent(visitor);
    String generateStateS = generateState(visitor);
    buffer.writeln(generateBlocS);
    buffer.writeln(generateEventS);
    buffer.writeln(generateStateS);
    return buffer.toString();
  }

  String generateKaism(ModelVisitor visitor) {
    String className = visitor.className;
    String params = "";
    final buffer = StringBuffer();
    // --------------------Start Generation Code--------------------//
    buffer.writeln('// Kaism generation');
    buffer.writeln(
        'class ${className}Kaism extends KaiSM<${className}Event, ${className}State>{');
    for (int i = 0; i < visitor.methods.length; i++) {
      MyMethodElement methodElement = visitor.methods[i];
      buffer.writeln('final ${methodElement.returnType} ${Helper.unCapitalizeFirstLetter(methodElement.returnType)};');
      params += "this.${Helper.unCapitalizeFirstLetter(methodElement.returnType)},";
    }
    buffer
        .writeln('${className}Kaism($params) : super(${className}Initial()) {');

    for (int i = 0; i < visitor.methods.length; i++) {
      MyMethodElement methodElement = visitor.methods[i];
      buffer.writeln(' handle.register<${Helper.capitalizeFirstLetter(methodElement.name)}>((event){_do${Helper.capitalizeFirstLetter(methodElement.name)}(event);});');
    }


    buffer.writeln('}');

    for (int i = 0; i < visitor.methods.length; i++) {
      MyMethodElement methodElement = visitor.methods[i];
      buffer.writeln(
          'void _do${Helper.capitalizeFirstLetter(Helper.capitalizeFirstLetter(methodElement.name))}(${Helper.capitalizeFirstLetter(methodElement.name)} event) async {');
      buffer.writeln('updateState(${className}Loading());');
      buffer.writeln('var result = await ${Helper.unCapitalizeFirstLetter(methodElement.returnType)}(event.param);');
      buffer.writeln('return updateState(');
      buffer.writeln('result.fold(');
      buffer.writeln('(l) => ${className}Error(l),');
      buffer.writeln('(r) => ${className}Success(r)));');
      buffer.writeln('}');
    }

    buffer.writeln('}');
    buffer.toString();
    return buffer.toString();
  }

  String generateEvent(ModelVisitor visitor) {
    String className = visitor.className;

    final buffer = StringBuffer();
    // --------------------Start Generation Code--------------------//
    buffer.writeln('// Event generation');
    buffer.writeln('@immutable');
    buffer.writeln('sealed class ${className}Event {}');
    for (int i = 0; i < visitor.methods.length; i++) {
      MyMethodElement methodElement = visitor.methods[i];
      buffer.writeln('class ${Helper.capitalizeFirstLetter(methodElement.name)} extends ${className}Event{');
      buffer.writeln('final ${methodElement.arguments.first.returnType} param;');
      buffer.writeln('${Helper.capitalizeFirstLetter(methodElement.name)}(this.param);');
      buffer.writeln('}');
    }

    buffer.toString();
    return buffer.toString();
  }

  String generateState(ModelVisitor visitor) {
    String success = "";
    String error = "";
    String className = visitor.className;
    for (int i = 0; i < visitor.fields.length; i++) {
      String dataType =
          visitor.fields.values.elementAt(i).toString().replaceAll("?", "");
      String fieldName = visitor.fields.keys.elementAt(i);
      if (!fieldName.toLowerCase().contains("state")) {
        continue;
      }
      if (fieldName.toLowerCase().contains("success")) {
        success = "final $dataType data; \n ${className}Success(this.data);";
      }
      if (fieldName.toLowerCase().contains("error")) {
        error = "final $dataType data; \n ${className}Error(this.data);";
      }
    }
    final buffer = StringBuffer();
    // --------------------Start Generation Code--------------------//
    buffer.writeln('// State generation');
    buffer.writeln('@immutable');
    buffer.writeln('sealed class ${className}State {}');
    buffer.writeln(
        'final class ${className}Initial extends ${className}State {}');
    buffer.writeln(
        'final class ${className}Loading extends ${className}State {}');
    buffer.writeln('final class ${className}Error extends ${className}State {');
    buffer.writeln(error);
    buffer.writeln('}');
    buffer
        .writeln('final class ${className}Success extends ${className}State {');
    buffer.writeln(success);
    buffer.writeln('}');
    buffer.toString();
    return buffer.toString();
  }
}
