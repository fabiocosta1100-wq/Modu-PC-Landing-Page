/* A preferência de tema é independente dos dados dos cartões. */
(() => {
  const themeToggle = document.getElementById("theme-toggle");
  const headerLogo = document.getElementById("header-logo");

  function setTheme(isDark) {
    document.body.classList.toggle("theme-dark", isDark);
    themeToggle?.setAttribute("aria-pressed", String(isDark));
    themeToggle?.setAttribute(
      "aria-label",
      isDark ? "Ativar modo claro" : "Ativar modo escuro",
    );
    if (headerLogo) {
      headerLogo.src = isDark
        ? "./modu-pc-logo-dark-v2.png"
        : "./modu-pc-logo.png";
    }
    try {
      localStorage.setItem("modu-theme", isDark ? "dark" : "light");
    } catch {
      // O botão continua funcional quando o browser não permite guardar preferências.
    }
  }

  let savedTheme = "light";
  try {
    savedTheme = localStorage.getItem("modu-theme") || "light";
  } catch {
    // Alguns previews locais não disponibilizam armazenamento.
  }
  setTheme(savedTheme === "dark");
  themeToggle?.addEventListener("click", () => {
    setTheme(!document.body.classList.contains("theme-dark"));
  });

  /* O Excel atualiza apenas estes campos públicos. Os textos estão no HTML. */
  const builds = window.MODU_BUILDS || {};
  document.querySelectorAll("[data-build-field]").forEach((element) => {
    const [buildName, field] = element.dataset.buildField.split(".");
    const value = builds[buildName]?.[field];
    if (value === undefined || value === null || value === "") return;

    if (field === "price") {
      const amount = String(value)
        .replace(/\s*€\s*$/, "")
        .trim();
      const currency = document.createElement("span");
      currency.className = "price-currency";
      currency.textContent = "€";
      element.replaceChildren(document.createTextNode(amount), currency);
    } else {
      element.textContent = String(value);
    }
  });

  /* Os logos acompanham os componentes mostrados, incluindo o HTML de reserva. */
  const brandAssets = {
    amd: {
      label: "AMD",
      src: "./assets/brands/amd.svg",
      matches: /\b(amd|ryzen|radeon)\b/i,
    },
    intel: {
      label: "Intel",
      src: "./assets/brands/intel.svg",
      matches: /\bintel\b/i,
    },
    nvidia: {
      label: "NVIDIA",
      src: "./assets/brands/nvidia.svg",
      matches: /\b(nvidia|geforce|quadro|rtx|gtx)\b/i,
    },
  };

  function createBrandLogo(brand, asset, decorative = false) {
    const image = document.createElement("img");
    image.className = `brand-logo brand-logo--${brand}`;
    image.src = asset.src;
    image.alt = decorative ? "" : asset.label;
    image.title = asset.label;
    return image;
  }

  document.querySelectorAll("[data-build-brands]").forEach((container) => {
    const card = container.closest("[data-build]");
    const references = ["cpu", "gpu"]
      .map(
        (field) =>
          card?.querySelector(`[data-build-field$=".${field}"]`)?.textContent ||
          "",
      )
      .join(" ");
    const logos = Object.entries(brandAssets)
      .filter(([, asset]) => asset.matches.test(references))
      .map(([brand, asset]) => createBrandLogo(brand, asset));
    container.replaceChildren(...logos);
    container.hidden = logos.length === 0;
  });

  /* CPU e gráfica têm a sua própria marca, depois de aplicar os dados do Excel. */
  document.querySelectorAll("[data-component-brand]").forEach((container) => {
    const card = container.closest("[data-build]");
    const field = container.dataset.componentBrand;
    const reference =
      card?.querySelector(`[data-build-field$=".${field}"]`)?.textContent || "";
    const brand = Object.entries(brandAssets).find(([, asset]) =>
      asset.matches.test(reference),
    );

    container.replaceChildren(
      ...(brand ? [createBrandLogo(...brand, true)] : []),
    );
    container.hidden = !brand;
  });
})();
