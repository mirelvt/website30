(function() {
    'use strict';

    function startAnimation(evt) {
        const btn = evt.target;
        const svg_elm = document.querySelector(`[data-elm="${btn.dataset.target
}"]`)
        const anim_elms = svg_elm.querySelectorAll('animateTransform, animate');

        svg_elm.dispatchEvent(new CustomEvent('startanimation'));

        for (const anim of anim_elms) {
            let e_parent = anim.parentNode;
            e_parent.dispatchEvent(new CustomEvent('startanimation'));
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        var btns = document.querySelectorAll('[data-trigger="startanimation"]');

        if (btns) {
            for (let btn of btns) {
                btn.addEventListener('click', startAnimation);
            }
        }
    });
})();
