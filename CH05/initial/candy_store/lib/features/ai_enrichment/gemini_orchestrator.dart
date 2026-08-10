import 'package:firebase_vertexai/firebase_vertexai.dart';

class GeminiOrchestrator {
  final FirebaseVertexAI _vertexAI = FirebaseVertexAI.instance;

  /// Uses gemini-3.6-flash for complex, multimodal reasoning (e.g., photo enrichment).
  Future<String?> analyzeProductImage(List<Part> imageParts) async {
    final model = _vertexAI.generativeModel(
      model: 'gemini-3.6-flash',
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
      ),
    );

    final prompt = TextPart("Analyze these product images and extract metadata as JSON.");
    final content = Content.multi([...imageParts, prompt]);

    final response = await model.generateContent([content]);
    return response.text;
  }

  /// Uses gemini-3.5-flash-lite for cost-effective, text-based reasoning (e.g., combinations/suggestions).
  Future<String?> generateCombinations(String productMetadata) async {
    final model = _vertexAI.generativeModel(
      model: 'gemini-3.5-flash-lite',
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
      ),
    );

    final prompt = TextPart("Given the following product metadata, suggest 3 matching items: $productMetadata");
    final content = Content.text(prompt.text);

    final response = await model.generateContent([content]);
    return response.text;
  }
}
