library generators;

import 'package:build/build.dart';
import 'package:generators/src/kaism_generator.dart';

import 'package:source_gen/source_gen.dart';
export 'package:generators/annotations/kaism.dart';

Builder generateKaism(BuilderOptions options) {
  // Step 1
  return SharedPartBuilder(
    [KaismGenerator()], // Step 2
    'kaism_generator', // Step 3
  );
}
