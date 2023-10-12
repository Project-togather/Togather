/*!
 * Template Functions
*/

(function($){

	"use strict";

	/* ---------------------------------------------- /*
	 * Preloader
	/* ---------------------------------------------- */

	$(window).on('load', function() {

		$('.page-loader').delay(300).fadeOut('slow');

		/* ---------------------------------------------- /*
		 * WOW Animation on page load
		/* ---------------------------------------------- */

		var wow = new WOW({
			mobile: false
		});

		wow.init();

	});

	$(document).ready(function() {

		/* ---------------------------------------------- /*
		 * Wrapper padding
		/* ---------------------------------------------- */

		var wrapper       = $('.wrapper');
		var header_height = $('.header').not('.header-transparent').height();

		wrapper.css("padding-top", header_height + 'px');

		$(window).on('resize', function() {
			var width    = Math.max($(window).width(), window.innerWidth);

			if ( width <= 991 ) {
				var header_height_small = $('.header').not('.header-transparent').height();
				wrapper.css("padding-top", header_height_small + 'px');
			} else {
				wrapper.css("padding-top", header_height + 'px');
			}
		})

		/* ---------------------------------------------- /*
		 * One Page Nav
		/* ---------------------------------------------- */

		$('.onepage-nav a').filter(function() {
			if ($(this).is(':not([href^="#"])')) {
				$(this).addClass('external');
			}
		});

		$('.onepage-nav').singlePageNav({
			filter: ':not(.external)',
			currentClass: 'active',
			offset: '58',
		});

		/* ---------------------------------------------- /*
		 * Mobile detect
		/* ---------------------------------------------- */

		var mobileTest;

		if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
			mobileTest = true;
		} else {
			mobileTest = false;
		}

		/* ---------------------------------------------- /*
		 * Header animation
		/* ---------------------------------------------- */

		var header = $('.header');

		$(window).scroll(function() {
			var scroll = $(window).scrollTop();

			if (scroll >= 1) {
				header.addClass('header-small');
				header.addClass('header-shadow');
			} else {
				header.removeClass('header-small');
				header.removeClass('header-shadow');
			}
			if ( ( $('.module-cover').length <= 0 ) && ( $('.module-cover-slides').length <= 0 ) ) {
				header.addClass('header-small');
			};
		}).scroll();

		/* ---------------------------------------------- /*
		 * Intro slider setup
		/* ---------------------------------------------- */

		$('.module-cover-slides').each(function () {
			$(this).superslides($.extend({
				play: 10000,
				animation: 'slide',
				animation_speed: 800,
				pagination: true,
			}, $(this).data('hero-slides-options')));
		});

		$(document).on('animated.slides', function() {
			var currentSlide = $('.module-cover-slides').superslides('current');
			var $this = $('.slides-container li').eq(currentSlide);
			$('.slides-container li').removeClass('active-slide');
			$this.addClass('active-slide');
			if ( $('.slides-container li.bg-dark').hasClass('active-slide') ) {
				header.addClass('header-light');
				$('.hero-slides').removeClass('dark-nav')
			} else {
				header.removeClass('header-light');
				$('.module-cover-slides').addClass('dark-nav')
			}
		});

		/* ---------------------------------------------- /*
		 * Setting background of modules
		/* ---------------------------------------------- */

		$('.parallax').each(function() {
			if ( $(this).attr('data-gradient') == 1 ) {
				$(this).append('<div class="overlay-background overlay-gradient"></div>');
				$(this).find('.overlay-background').css('opacity', $(this).attr('data-overlay'));
			} else {
				$(this).append('<div class="overlay-background"></div>');
				$(this).find('.overlay-background').css('opacity', $(this).attr('data-overlay'));
			}
		});

		$('[data-background]').each(function() {
			$(this).css('background-image', 'url(' + $(this).attr('data-background') + ')');
		});

		$('[data-mY]').each(function() {
			$(this).css('margin-top', $(this).attr('data-mY') );
		});

		$('[data-color]').each(function() {
			$(this).css('color', $(this).attr('data-color') );
		});

		/* ---------------------------------------------- /*
		 * Blog masonry
		/* ---------------------------------------------- */

		$(window).on('resize', function() {
			setTimeout(function() {
				$('.blog-masonry').isotope({
					layoutMode: 'masonry',
					transitionDuration: '0.5s',
				});
			}, 1000);
		});
		/* ---------------------------------------------- /*
		 * Offcanvas sidebar
		/* ---------------------------------------------- */

		$('.open-offcanvas, .close-offcanvas').on('click', function() {
			$('body').toggleClass('off-canvas-sidebar-open');
			return false;
		}).resize();

		$(document).on('click', function(e) {
			var container = $('.off-canvas-sidebar');
			if (!container.is(e.target) && container.has(e.target).length === 0) {
				$('body').removeClass('off-canvas-sidebar-open');
			}
		}).resize();

		function getScrollBarWidth() {
			var inner = document.createElement('p');
			inner.style.width = "100%";
			inner.style.height = "200px";
			var outer = document.createElement('div');
			outer.style.position = "absolute";
			outer.style.top = "0px";
			outer.style.left = "0px";
			outer.style.visibility = "hidden";
			outer.style.width = "200px";
			outer.style.height = "150px";
			outer.style.overflow = "hidden";
			outer.appendChild (inner);
			document.body.appendChild (outer);
			var w1 = inner.offsetWidth;
			outer.style.overflow = 'scroll';
			var w2 = inner.offsetWidth;
			if (w1 == w2) w2 = outer.clientWidth;
			document.body.removeChild (outer);
			return (w1 - w2);
		};

		$('.off-canvas-sidebar-wrapper').css('margin-right', '-' + getScrollBarWidth() + 'px');

		$(window).on('resize', function() {
			var width    = Math.max($(window).width(), window.innerWidth);

			if ( width <= 991 ) {
				$('body').removeClass('off-canvas-sidebar-open');
			}
		});
		/* ---------------------------------------------- /*
		 * Slides
		/* ---------------------------------------------- */

		$('.hero-text-slider').each(function () {
			$(this).owlCarousel($.extend({
				dots:       false,
				nav:        false,
				center:     1,
				items:      1,
				loop:       1,
				autoHeight: 1,
				margin:     0,
				autoplay:   1,
				navText: [
					'<span class="ti-angle-left"></span>',
					'<span class="ti-angle-right"></span>'
				],
			}, $(this).data('carousel-options')));
		});

		$('.image-slider').each(function () {
			$(this).owlCarousel($.extend({
				dots:       false,
				nav:        1,
				center:     1,
				items:      1,
				loop:       1,
				autoHeight: 1,
				margin:     0,
				navText: [
					'<span class="ti-angle-left"></span>',
					'<span class="ti-angle-right"></span>'
				],
			}, $(this).data('carousel-options')));
		});

		$('.menu-carousel').each(function () {
			$(this).owlCarousel($.extend({
				nav:      true,
				autoplay: true,
				items:    1,
				margin:   30,
				responsive: {
					768: {
						items: 3
					}
				},
				navText: [
					'<span class="arrows arrows-arrows-slim-left"></span>',
					'<span class="arrows arrows-arrows-slim-right"></span>'
				],
			}, $(this).data('carousel-options')));
		});

		$('.clients-carousel').each(function () {
			$(this).owlCarousel($.extend({
				nav:      false,
				dots:     false,
				autoplay: true,
				items:    2,
				responsive: {
					768: {
						items: 6
					}
				},
				navText: [
					'<span class="ti-angle-left"></span>',
					'<span class="ti-angle-right"></span>'
				],
			}, $(this).data('carousel-options')));
		});

		$('.review-slides').each(function () {
			$(this).owlCarousel($.extend({
				nav:      true,
				autoplay:        5000,
				items:      1,

				loop:       1,
				navText: [
					'<span class="arrows arrows-arrows-slim-left"></span>',
					'<span class="arrows arrows-arrows-slim-right"></span>'
				],
			}, $(this).data('carousel-options')));
		});

		/* ---------------------------------------------- /*
		 * Progress bars, counters, pie charts animations
		/* ---------------------------------------------- */

		$('.progress-item').each(function() {
			$(this).appear(function() {
				var percent = $(this).find('.progress-bar').attr('aria-valuenow');
				$(this).find('.progress-bar').animate({'width' : percent + '%'});
				$(this).find('.progress-number').countTo({
					from: 0,
					to: percent,
					speed: 900,
					refreshInterval: 30
				});
			});
		});

		$('.counter-timer').each(function() {
			$(this).appear(function() {
				var number = $(this).attr('data-to');
				$(this).countTo({
					from: 0,
					to: number,
					speed: 1500,
					refreshInterval: 10,
					formatter: function (number, options) {
						number = number.toFixed(options.decimals);
						number = number.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						return number;
					}
				});
			});
		});

		$('.chart').each(function() {
			$(this).appear(function() {
				$(this).easyPieChart($.extend({
					barColor:   '#000000',
					trackColor: '#eeeeee',
					scaleColor: false,
					lineCap:    'round',
					lineWidth:  3,
					size:       150,
				}, $(this).data('chart-options')));
			});
		});

		$('.appear-childer').each(function() {
			var animate_delay = 0.2;
			$(this).appear(function() {
				$(this).children().each(function() {
					$(this).css({ "transition-delay" : animate_delay + "s" });
					$(this).addClass('anim-end');
					animate_delay = animate_delay + 0.2;
				});
			});
		});

		/* ---------------------------------------------- /*
		 * Twitter
		/* ---------------------------------------------- */

		$('.twitter-feed').each(function (index) {
			$(this).attr('id', 'twitter-' + index);
			var twitterID      = $(this).data('twitter');
			var twitterMax     = $(this).data('number');
			var twitter_config = {
				'id':             twitterID,
				'domId':          'twitter-' + index,
				'maxTweets':      twitterMax,
				'enableLinks':    true,
				'showPermalinks': false
			};
			twitterFetcher.fetch(twitter_config);
		});

		/* ---------------------------------------------- /*
		 * Lightbox, Gallery
		/* ---------------------------------------------- */

		// Gallery Content

		$('.gallery [rel=gallery]').magnificPopup({
			type: 'image',
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1]
			},
			image: {
				titleSrc: 'title',
				tError: 'The image could not be loaded.',
			},
		});

		// Gallery Shortcode

		$('.gallery').magnificPopup({
			delegate:        'a',
			type:            'image',
			fixedContentPos: false,
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1]
			},
			image: {
				titleSrc: 'title',
				tError: 'The image could not be loaded.',
			},
			callbacks: {

				open: function() {
					$('body').addClass('noscroll');
					$('html').css('margin-right', '17px');
				},

				close: function() {
					$('body').removeClass('noscroll');
					$('html').css('margin-right', 0);
				}
			}
		});

		// Single photo

		$('a.photo').magnificPopup({
			type:            'image',
			fixedContentPos: false,
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1]
			},
			image: {
				titleSrc: 'title',
				tError: 'The image could not be loaded.',
			},
			callbacks: {

				open: function() {
					$('body').addClass('noscroll');
					$('html').css('margin-right', '17px');
				},

				close: function() {
					$('body').removeClass('noscroll');
					$('html').css('margin-right', 0);
				}
			}
		});

		// Book a Table Popup
		$('.popup-book-a-table').magnificPopup({
			type:            'inline',
			preloader:       false,
			focus:           '#name',
			fixedContentPos: false,
			modal:           true,
			callbacks: {

				beforeOpen: function() {
					if ($(window).width() < 700) {
						this.st.focus = false;
					} else {
						this.st.focus = '#name';
					}
				},

				open: function() {
					$('body').addClass('noscroll');
					$('html').css('margin-right', '17px');
				},

				close: function() {
					$('body').removeClass('noscroll');
					$('html').css('margin-right', 0);
				}
			}
		});

		$(document).on('click', '.popup-modal-dismiss', function (e) {
			e.preventDefault();
			$.magnificPopup.close();
		});

		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		})

		/* ---------------------------------------------- /*
		 * A jQuery plugin for fluid width video embeds
		/* ---------------------------------------------- */

		$('body').fitVids();

		/* ---------------------------------------------- /*
		 * Google Map
		/* ---------------------------------------------- */

		$('.map').each(function() {

			var reg_exp = /\[[^(\]\[)]*\]/g;

			var map_div        = $(this);
			var is_draggable   = Math.max($(window).width(), window.innerWidth) > 736 ? true : false;
			var is_street_view = ( map_div.data('street-view') ) ? true : false;

			if (map_div.length > 0) {

				var markers_addresses = map_div[0].getAttribute('data-addresses').match(reg_exp),
					markers_info      = map_div[0].getAttribute('data-info').match(reg_exp),
					markers_icon      = map_div.data('icon'),
					map_zoom          = map_div.data('zoom');

				var	markers_values = [], map_center;

				markers_addresses.forEach( function(marker_address, index) {
					var marker_value = '{'
					marker_value    += '"latLng":' + marker_address;
					if (index == 0) {
						map_center = JSON.parse(marker_address);
					};
					if (markers_info[index]) {
						var marker_data = markers_info[index].replace(/\[|\]/g, '');
						marker_value   += ', "data":"' + marker_data + '"';
					};
					marker_value += '}';
					markers_values.push(JSON.parse(marker_value));
				});

				var map_options = {
					scrollwheel: false,
					styles: [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#e9e9e9"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ffffff"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#ffffff"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":21}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#333333"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]}]
				};

				map_options.center    = map_center;
				map_options.zoom      = map_zoom;
				map_options.draggable = is_draggable;

				var markers_options = {
					icon: markers_icon,
				};

				var map_config = {
					map: {
						options: map_options,
					},
					streetviewpanorama: {
						options: {
							container: $(this),
							opts: {
								visible:  is_street_view,
								position: map_center,
								enableCloseButton: true,
								scrollwheel: false,
							}
						}
					},
					marker: {
						values:  markers_values,
						options: markers_options,
						events: {
							click: function(marker, event, context) {
								if (context.data) {
									var map        = $(this).gmap3("get"),
										infowindow = $(this).gmap3({get:{name:"infowindow"}});
									if (infowindow) {
										infowindow.open(map, marker);
										infowindow.setContent(context.data);
									} else {
										$(this).gmap3({
											infowindow:{
												anchor:marker,
												options:{content: context.data}
											}
										});
									}
								}
							}
						}
					}
				};

				map_div.gmap3(map_config);
			};
		});

		/* ---------------------------------------------- /*
		 * Snow effect
		/* ---------------------------------------------- */

		if ( $("#particles-snow-js").length > 0 ) {

			particlesJS('particles-snow-js', {
				"particles": {
						"number": {
							"value": 400,
							"density": {
								"enable": true,
								"value_area": 800
							}
						},
						"color": {
							"value": "#fff"
						},
						"shape": {
							"type": "circle",
							"stroke": {
								"width": 0,
								"color": "#000000"
							},
							"polygon": {
								"nb_sides": 5
							},
							"image": {
								"src": "img/github.svg",
								"width": 100,
								"height": 100
							}
						},
						"opacity": {
							"value": 0.5,
							"random": true,
							"anim": {
								"enable": false,
								"speed": 1,
								"opacity_min": 0.1,
								"sync": false
							}
						},
						"size": {
							"value": 7,
							"random": true,
							"anim": {
								"enable": false,
								"speed": 40,
								"size_min": 0.1,
								"sync": false
							}
						},
						"line_linked": {
							"enable": false,
							"distance": 500,
							"color": "#ffffff",
							"opacity": 0.4,
							"width": 2
						},
						"move": {
							"enable": true,
							"speed": 6,
							"direction": "bottom",
							"random": false,
							"straight": false,
							"out_mode": "out",
							"bounce": false,
							"attract": {
								"enable": false,
								"rotateX": 600,
								"rotateY": 1200
							}
						}
					},
					"interactivity": {
						"detect_on": "canvas",
						"events": {
							"onhover": {
								"enable": true,
								"mode": "bubble"
							},
							"onclick": {
								"enable": true,
								"mode": "repulse"
							},
							"resize": true
						},
						"modes": {
							"grab": {
								"distance": 400,
								"line_linked": {
									"opacity": 0.5
								}
							},
							"bubble": {
								"distance": 400,
								"size": 4,
								"duration": 0.3,
								"opacity": 1,
								"speed": 3
							},
							"repulse": {
								"distance": 200,
								"duration": 0.4
							},
							"push": {
								"particles_nb": 4
							},
							"remove": {
								"particles_nb": 2
							}
						}
					},
					"retina_detect": true
				});
		};

		/* ---------------------------------------------- /*
		 * Scroll Animation
		/* ---------------------------------------------- */

		$('.smoothscroll').on('click', function(e) {
			var target  = this.hash;
			var $target = $(target);
			$('html, body').stop().animate({
				'scrollTop': $target.offset().top - 58
			}, 600, 'swing');
			e.preventDefault();
		});

		/* ---------------------------------------------- /*
		 * Scroll top
		/* ---------------------------------------------- */

		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('.scroll-top').addClass('scroll-top-visible');
			} else {
				$('.scroll-top').removeClass('scroll-top-visible');
			}
		});

		$('a[href="#top"]').on('click', function() {
			$('html, body').animate({ scrollTop: 0 }, 'slow');
			return false;
		});

		/* ---------------------------------------------- /*
		 * Parallax
		/* ---------------------------------------------- */

		$('.parallax').jarallax({
			speed: 0.4
		});

	});

})(jQuery);
