# LanguageTool Server Add-Ons
## ngrams
<!-- See [dev docs](https://dev.languagetool.org/finding-errors-using-n-gram-data) for instructions. -->

[Download](https://languagetool.org/download/ngram-data/) pretrained ngram data and extract it to `$HOME/.local/share/language-tool/ngram`.

## word2vec
See [LanguageTool changelog](https://github.com/languagetool-org/languagetool/blob/master/languagetool-standalone/CHANGES.md#word2vec) for instructions.

[Download](https://languagetool.org/download/word2vec/) the trained model and extract it to `$HOME/.local/share/language-tool/word2vec`.

## Configuration
Make sure the LanguageTool configuration file, `$HOME/.languagetool.cfg`, includes the following settings:

```ini
ngramDir = ~/.local/share/language-tool/ngram
word2vecDir = ~/.local/share/language-tool/word2vec
```

A complete list of options can be found in [the LanguageTool sources](https://github.com/languagetool-org/languagetool/blob/master/languagetool-gui-commons/src/main/java/org/languagetool/gui/Configuration.java#L85-L125).
