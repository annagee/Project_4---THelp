CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "simple";

  // ... rest of the original config.js  ...
}

RailsAdmin.config do |config|
  config.model Team do
    edit do
      # For RailsAdmin >= 0.5.0
      field :description, :ck_editor
      # For RailsAdmin < 0.5.0
      # field :description do
      #   ckeditor true
      # end
    end
  end
end