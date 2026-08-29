(function () {
  "use strict";

  document.addEventListener("DOMContentLoaded", function () {
    var dialog = document.getElementById("publication-bibtex-dialog");
    var code = document.getElementById("publication-bibtex-code");
    var title = document.getElementById("publication-bibtex-title");
    var copyButton = dialog && dialog.querySelector(".publication-bibtex-copy");

    if (!dialog || !code || !title) return;

    function closeDialog() {
      if (typeof dialog.close === "function") dialog.close();
      else dialog.removeAttribute("open");
    }

    document.querySelectorAll(".publication-bibtex-trigger").forEach(function (trigger) {
      trigger.addEventListener("click", function () {
        var template = document.getElementById(trigger.dataset.bibtexId);
        if (!template) return;

        code.textContent = template.content.textContent.trim();
        title.textContent = trigger.dataset.bibtexTitle;
        copyButton.textContent = "Copy BibTeX";

        if (typeof dialog.showModal === "function") dialog.showModal();
        else dialog.setAttribute("open", "");
      });
    });

    dialog.querySelector(".publication-bibtex-close").addEventListener("click", closeDialog);
    dialog.querySelector(".publication-bibtex-done").addEventListener("click", closeDialog);
    dialog.addEventListener("click", function (event) {
      if (event.target === dialog) closeDialog();
    });

    copyButton.addEventListener("click", function () {
      navigator.clipboard.writeText(code.textContent).then(function () {
        copyButton.textContent = "Copied";
      });
    });
  });
})();
