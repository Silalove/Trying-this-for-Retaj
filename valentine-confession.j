// الانتظار حتى يتم تحميل الصفحة بالكامل
$(document).ready(function() {
    
    // الاستماع إلى تغيير حالة مربع الاختيار (#messageState)
    $("#messageState").on("change", (x) => {
        // إزالة فئات الرسوم المتحركة القديمة من الرسالة
        $(".message").removeClass("openNor").removeClass("closeNor");
        // إخفاء التعليمات عند النقر
        $(".instruction").hide(100);

        if ($("#messageState").is(":checked")) {
            // حالة الفتح: تشغيل رسالة الفتح وحركة القلب للأسفل وتغيير لون الخلفية
            $(".message").removeClass("closed").removeClass("no-anim").addClass("openNor");
            $(".heart").removeClass("closeHer").removeClass("openedHer").addClass("openHer");
            // تغيير لون الخلفية للوردي الداكن
            $(".container").stop().animate({"backgroundColor": "#f48fb1"}, 2000); 
        } else {
            // حالة الإغلاق: تشغيل رسالة الإغلاق وحركة القلب للأعلى وتغيير لون الخلفية
            $(".message").removeClass("no-anim").addClass("closeNor");
            $(".heart").removeClass("openHer").removeClass("openedHer").addClass("closeHer");
            // تغيير لون الخلفية للوردي الفاتح
            $(".container").stop().animate({"backgroundColor": "#fce4ec"}, 2000); 
        }
    });

    // معالج انتهاء الرسوم المتحركة للرسالة
    $(".message").on('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e) {
        // بعد انتهاء الإغلاق، نضبط حالة الإغلاق النهائية
        if ($(".message").hasClass("closeNor"))
            $(".message").addClass("closed");
        $(".message").removeClass("openNor").removeClass("closeNor").addClass("no-anim");
    });

    // معالج انتهاء الرسوم المتحركة للقلب
    $(".heart").on('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e) {
        // بعد انتهاء الفتح، نضبط موضع القلب النهائي ونعيد تشغيل النبض
        if (!$(".heart").hasClass("closeHer"))
            $(".heart").addClass("openedHer").addClass("beating");
        else
            // بعد انتهاء الإغلاق، نوقف النبض ونزيل فئة الموضع النهائي
            $(".heart").removeClass("openedHer").removeClass("beating");
        $(".heart").removeClass("openHer").removeClass("closeHer");
    });
});
