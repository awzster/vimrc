import eslintRecommended from "@eslint/js";
import stylistic from "@stylistic/eslint-plugin";

export default [
  eslintRecommended.configs.recommended,
  {
    plugins: {
      stylistic,
    },
    rules: {
      "quotes": ["error", "single", { "avoidEscape": true }],
      "stylistic/brace-style": ["error", "allman", { "allowSingleLine": true }],

      // Управление отступами — 2 пробела (или 4, по вашему выбору)
      "stylistic/indent": ["error", 2, {
        "SwitchCase": 1,       // отступ для case внутри switch
        "VariableDeclarator": 1,
        "outerIIFEBody": 1,
        "FunctionDeclaration": { "parameters": 1, "body": 1 },
        "FunctionExpression": { "parameters": 1, "body": 1 },
        "CallExpression": { "arguments": 1 },
        "ArrayExpression": 1,
        "ObjectExpression": 1,
        "ImportDeclaration": 1,
        "flatTernaryExpressions": false,
        "ignoredNodes": ["TemplateLiteral *"],
        "ignoreComments": false
      }],
    },
    languageOptions: {
      ecmaVersion: 2020,
      sourceType: "module",
    },
  },
];

