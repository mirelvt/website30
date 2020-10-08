(function() {
    "use strict";

    function animHomeNav(container) {
        const photo = container.querySelector('.photo-me');
        const img_border = container.querySelector('.img-border');
        const nav_line_1 = container.querySelector('.nav-line-1');
        const nav_line_2 = container.querySelector('.nav-line-2');
        const nav_text_1 = container.querySelector('.nav-text-1');
        const nav_text_2 = container.querySelector('.nav-text-2');


        let animations = {};
        // Transitions
        const trans_border = [
            { strokeDashoffset: '1010' },
            { strokeDashoffset: '0' }
        ];

        const trans_photo = [
            { clipPath: 'circle(0%)' },
            { clipPath: 'circle(43%)' }
        ];

        const trans_nav_lines = [
            { width: '0' },
            { width: '120px' }
        ];

        const trans_nav_text = [{
            'opacity': '0',
            'filter': 'url(#blur)'
        }, {
            'opacity': '1',
            'filter': 'url(#unblur)'
        }];

        const trans_shake = [
            { transform: 'translateY(0)' },
            { transform: 'translateY(4px)' },
            { transform: 'translateY(0)' },
            { transform: 'translateY(-4px)' },
            { transform: 'translateY(0)' }
        ];
        // -------

        // Timings
        const t = {
            duration: 1000,
            delay: 1200,
            easing: 'cubic-bezier(0.76, 0, 0.24, 1)',
            iterations: 1,
            fill: 'forwards'
        };

        const t_text = {
            duration: 1000,
            delay: 1800,
            iteration: 1,
            fill: 'forwards'
        };

        // Animated elements
        animations.Photo = photo.animate(trans_photo, {
            duration: 1000,
            delay: 500,
            easing: 'cubic-bezier(0.25, 1, 0.5, 1)',
            iterations: 1,
            fill: 'forwards'
        });

        animations.imgBorder = img_border.animate(trans_border, t, t.delay = 700);

        animations.NavLine = nav_line_1.animate(trans_nav_lines, t, t.delay = 1000);
        animations.navText = nav_text_1.animate(trans_nav_text, t_text);
        animations.navTextShake = nav_text_1.animate(trans_shake, {
            duration: 30,
            delay: 2400,
            iterations: 8
        });

        animations.NavLine = nav_line_2.animate(trans_nav_lines, t, t.delay = 2000);
        animations.navText = nav_text_2.animate(trans_nav_text, t_text, t_text.delay = 2800);
        animations.navTextShake = nav_text_2.animate(trans_shake, {
            duration: 30,
            delay: 3400,
            iterations: 8
        });
        // ---------
    }

    document.addEventListener("DOMContentLoaded", function() {
        document.documentElement.classList.remove('no-js');
        animHomeNav(document.querySelector('.svg-home-nav'));
    });
})();
