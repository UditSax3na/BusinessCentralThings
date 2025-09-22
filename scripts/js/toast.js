(function () {
    // CSS for animation & style
    const style = document.createElement("style");
    style.innerHTML = `
    .bc-toast {
        min-width: 280px;
        max-width: 350px;
        margin: 10px;
        padding: 12px 16px;
        border-radius: 8px;
        font-family: 'Segoe UI', sans-serif;
        font-size: 14px;
        color: #fff;
        position: fixed;
        display: flex;
        flex-direction: column;
        box-shadow: 0 4px 6px rgba(0,0,0,0.2);
        opacity: 0;
        transform: translateX(100%);
        transition: all 0.5s ease-in-out;
        z-index: 99999;
    }
    .bc-toast.show {
        opacity: 1;
        transform: translateX(0);
    }
    .bc-toast.success { background: #38a169; } /* green */
    .bc-toast.error { background: #e53e3e; }   /* red */
    .bc-toast.info { background: #3182ce; }    /* blue */
    .bc-toast.warning { background: #d69e2e; } /* yellow */
    .bc-toast-title { font-weight: bold; margin-bottom: 4px; }
    `;
    document.head.appendChild(style);

    window.ShowToast = function (title, message, type, position) {
        let toast = document.createElement("div");
        toast.className = `bc-toast ${type}`;

        // Position
        if (position === "left") {
            toast.style.left = "20px";
            toast.style.bottom = "20px";
            toast.style.transform = "translateX(-120%)";
        } else {
            toast.style.right = "20px";
            toast.style.bottom = "20px";
            toast.style.transform = "translateX(120%)";
        }

        // Content
        let t = document.createElement("div");
        t.className = "bc-toast-title";
        t.innerText = title;

        let m = document.createElement("div");  
        m.className = "bc-toast-message";
        m.innerText = message;

        toast.appendChild(t);
        toast.appendChild(m);
        document.body.appendChild(toast);

        // Trigger animation
        setTimeout(() => toast.classList.add("show"), 50);

        // Auto remove
        setTimeout(() => {
            toast.classList.remove("show");
            setTimeout(() => toast.remove(), 500);
        }, 4000);
    };

    Microsoft.Dynamics.NAV.OnInvokeExtensibilityMethod = function (methodName, parameters) {
        if (methodName === "ShowToast") {
            window.ShowToast(parameters[0], parameters[1], parameters[2], parameters[3]);
        }
    };
})();