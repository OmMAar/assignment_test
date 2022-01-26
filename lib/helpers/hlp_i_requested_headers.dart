mixin RequestedHeaders {
  void putExcerptLengthInHeader();

  void putMaximumAgeInHeader();

  void putPipelineInHeader();

  void putFieldsToIncludeInHeader();

  void putFormatInHeader();

  void setAQ(String value, bool lang);

  void applyActiveCheck();

  Map<String, String> getRequestHeaderParams();
}
