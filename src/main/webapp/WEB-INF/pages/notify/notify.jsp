<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath() %>"/><c:if test="${path eq '/'}"><c:set var="path" value=""/></c:if>

<!-- Dev Notice -->
    <link href="${path}/statics/assets/plugins/pnotify-master/devnote.css" rel="stylesheet" type="text/css" />

    <!-- Page Style -->
    <link href="${path}/statics/assets/plugins/pnotify-master/includes/style.css" rel="stylesheet" type="text/css" />

    <!-- Animate.css -->
    <link href="${path}/statics/assets/plugins/animate.css-master/animate.min.css" rel="stylesheet" type="text/css" />

    <!-- jQuery -->

    <!-- jQuery UI -->
    <link href="${path}/statics/assets/plugins/jquery-ui-1.11.4/jquery-ui.css" media="all" rel="stylesheet" type="text/css" />

    <!-- Bootstrap -->

    <!-- Theme Switcher Widget -->
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/includes/themeswitcher/jquery.themeswitcher.min.js"></script>



    <!-- JavaScript Source Formatting -->
    <link href="${path}/statics/assets/plugins/pnotify-master/includes/google-code-prettify/prettify.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/includes/google-code-prettify/prettify.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/includes/beautify.js"></script>

    <!-- PNotify -->
    <script type="text/javascript" src="src/pnotify.js"></script>
    <link href="${path}/statics/assets/plugins/pnotify-master/src/pnotify.css" rel="stylesheet" type="text/css" />
    <link href="${path}/statics/assets/plugins/pnotify-master/src/pnotify.brighttheme.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.animate.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.buttons.js"></script>
    <link href="${path}/statics/assets/plugins/pnotify-master/src/pnotify.buttons.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.confirm.js"></script>
    <link href="${path}/statics/assets/plugins/pnotify-master/src/pnotify.nonblock.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.nonblock.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.mobile.js"></script>
    <link href="${path}/statics/assets/plugins/pnotify-master/src/pnotify.mobile.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.desktop.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.history.js"></script>
    <link href="${path}/statics/assets/plugins/pnotify-master/src/pnotify.history.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.callbacks.js"></script>
    <script type="text/javascript" src="${path}/statics/assets/plugins/pnotify-master/src/pnotify.reference.js"></script>

    <!-- PForm (For the form notice.) -->
    <link href="${path}/statics/assets/css/pform.css" media="all" rel="stylesheet" type="text/css" />
    <!--[if lt IE 8]>
    <link href="${path}/statics/assets/css/pform-ie-lt-8.css" media="all" rel="stylesheet" type="text/css" />
    <![endif]-->
    <style type="text/css">
        .pform_custom div.pf-element .pf-label, .pform_custom div.pf-element .pf-note {
            width: 130px; /* Width of labels. */
            font-weight: normal;
        }
        .pform_custom div.pf-element .pf-group {
            margin-left: 130px; /* Same as width of labels. */
        }
        .pform_custom div.pf-buttons {
            padding-left: 115px; /* Width of labels + margin to inputs - button spacing. */
        }
    </style>
    <!--[if lt IE 7]>
    <style type="text/css">
        .pform_custom div.pf-buttons {
            width: 225px; /* Custom form width - custom button div left padding - 20px (for IE's default padding.) */
        }
    </style>
    <![endif]-->

    <!-- Custom Styling -->
    <style type="text/css">
        /* Not PNotify specific, just make this page a little more presentable. */
        #switcher-container {
            position: fixed;
            top: 60px;
            right: 5px;
            z-index: 100;
        }
        #switcher-jqueryui, #switcher-jqueryui * {
            box-sizing: content-box;
        }
        @media (max-width: 980px) {
            #switcher-container {
                position: absolute;
                top: 55px;
            }
        }
        .ui-widget {
            font-size: 75% !important;
        }
        .btn-toolbar {
            line-height: 28px;
        }
        .btn-toolbar h4 {
            margin: 1em 0 .3em;
        }
        .btn-toolbar .btn-group {
            vertical-align: middle;
        }
        .panel .btn {
            margin-top: 5px;
        }

        /* Translucent notice CSS */
        .ui-pnotify.translucent.ui-pnotify-fade-in {
            opacity: .8;
        }

        /* Custom styled notice CSS */
        .ui-pnotify.custom .ui-pnotify-container {
            background-color: #404040 !important;
            background-image: none !important;
            border: none !important;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            border-radius: 10px;
        }
        .ui-pnotify.custom .ui-pnotify-title, .ui-pnotify.custom .ui-pnotify-text {
            font-family: Arial, Helvetica, sans-serif !important;
            text-shadow: 2px 2px 3px black !important;
            font-size: 10pt !important;
            color: #FFF !important;
            padding-left: 50px !important;
            line-height: 1 !important;
            text-rendering: geometricPrecision !important;
        }
        .ui-pnotify.custom .ui-pnotify-title {
            font-weight: bold;
        }
        .ui-pnotify.custom .ui-pnotify-icon {
            float: left;
        }
        .ui-pnotify.custom .fa {
            margin: 3px;
            width: 33px;
            height: 33px;
            font-size: 33px;
            color: #FF0;
        }

        /* Alternate stack initial positioning. This one is done through code,
            to show how it is done. Look down at the stack_bottomright variable
            in the JavaScript below. */
        .ui-pnotify.stack-bottomright {
            /* These are just CSS default values to reset the PNotify CSS. */
            right: auto;
            top: auto;
            left: auto;
            bottom: auto;
        }
        .ui-pnotify.stack-custom {
            /* Custom values have to be in pixels, because the code parses them. */
            top: 200px;
            left: 200px;
            right: auto;
        }
        .ui-pnotify.stack-custom2 {
            top: auto;
            left: auto;
            bottom: 200px;
            right: 200px;
        }
        /* This one is totally different. It stacks at the top and looks
            like a Microsoft-esque browser notice bar. */
        .ui-pnotify.stack-bar-top {
            right: 0;
            top: 0;
        }
        .ui-pnotify.stack-bar-bottom {
            margin-left: 15%;
            right: auto;
            bottom: 0;
            top: auto;
            left: auto;
        }
    </style>

    <!-- Demo Code -->
    <script type="text/javascript">
        var permanotice, tooltip, _alert;
        $(function(){
            // ---
            // Notice that opens when the page opens.
            // ---
            new PNotify({
                title: "PNotify",
                text: "Welcome. Try hovering over me. You can click things behind me, because I'm non-blocking.",
                delay: 12000,
                nonblock: {
                    nonblock: true
                },
                before_close: function(notice){
                    // You can access the notice's options with this. It is read only.
                    //notice.options.text;

                    // You can change the notice's options after the timer like this:
                    //notice.update({
                    //    title: notice.options.title+" - Enjoy your Stay",
                    //    before_close: null
                    //});
                    //notice.queueRemove();
                    //return false;
                }
            });

            // ---
            // This notice is the tooltip demo.
            // ---
            var make_tooltip = function(){
                tooltip = new PNotify({
                    title: "Tooltip",
                    text: "I'm not in a stack. I'm positioned like a tooltip with JavaScript.",
                    hide: false,
                    buttons: {
                        closer: false,
                        sticker: false
                    },
                    history: {
                        history: false
                    },
                    animate_speed: "fast",
                    opacity: .9,
                    icon: "fa fa-commenting",
                    // Setting stack to false causes PNotify to ignore this notice when positioning.
                    stack: false,
                    auto_display: false
                });
                // Remove the notice if the user mouses over it.
                tooltip.get().mouseout(function(){
                    tooltip.remove();
                });
            };
            // I put it in a function so I could show the source easily.
            make_tooltip();

            // ---
            // This creates all those source code view buttons.
            // ---
            $("body").on("mouseenter click", ".source", function(){
                var button = $(this);
                button.addClass("dropdown-toggle").attr("data-toggle", "dropdown");
                // Wrap the button in a container.
                var contain = $('<div class="btn-group" />');
                contain = button.wrap(contain).parent();
                // Add a source button.
                $('<ul class="dropdown-menu"><li><a href="javascript:void(0)">See the source</a></li></ul>').on("click", "a", function(){
                    $(this).blur();
                    var text = button.attr("onclick");
                    if (!text && button.attr("onmouseover"))
                        text = "// Mouse Over:\n"+button.attr("onmouseover")+"\n\n// Mouse Move:\n"+button.attr("onmousemove")+"\n\n// Mouse Out:\n"+button.attr("onmouseout");
                    // IE needs this.
                    if (text.toString) {
                        text = text.toString();
                        if (text.match(/^function (onclick|anonymous)[\n ]*\([^\)]*\)[\n ]*\{[\n\t ]*/))
                            text = text.replace(/^function (onclick|anonymous)[\n ]*\([^\)]*\)[\n ]*\{[\n\t ]*/, "").replace(/[\n\t ]*}[\n\t ]*$/, "");
                    }
                    // Is there a better way to do this?
                    var dialog = $('<div class="modal fade"><div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title">'+button.text()+' - Source</h4></div><div class="modal-body"></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Ok, got it.</button></div></div></div></div>');
                    $("<pre class=\"prettyprint\" />").text(js_beautify(text)).appendTo(dialog.find(".modal-body"));
                    // Check if the code is just calling a function. Include that function.
                    if (text.match(/^\w*\([^\)]*\);$/)) {
                        var f_name = text.replace(/\(.*/g, "");
                        text = window[f_name].toString();
                        $("<pre class=\"prettyprint\" />").text(js_beautify(text)).appendTo(dialog.find(".modal-body"));
                    }
                    // Check if this is the tooltip button. Include the tooltip function.
                    if (text.match(/tooltip\.open\(\);/)) {
                        $("<pre class=\"prettyprint\" />").text(js_beautify(make_tooltip.toString())).appendTo(dialog.find(".modal-body"));
                    }
                    dialog.on("shown.bs.modal", function(){
                        prettyPrint();
                    }).on("hidden.bs.modal", function(){
                        dialog.remove();
                    }).modal();
                }).appendTo(contain);
                button.removeClass("source");
            });
            prettyPrint(); // Format source in help.

            // ---
            // jQuery UI Theme Switcher widget.
            // ---
            if ($.fn.themeswitcher) {
                $('#switcher-jqueryui').themeswitcher({imgpath: "includes/themeswitcher/images/"});
            } else {
                $('#switcher-jqueryui').html("Couldn't load theme switcher widget.");
            }
            // Navbar scrollspy.
            $('#navbar').scrollspy();
        });

        function show_rich() {
            new PNotify({
                title: '<span style="color: green;">Rich Content Notice</span>',
                text: '<span style="color: blue;">Look at my beautiful <strong>strong</strong>, <em>emphasized</em>, and <span style="font-size: 1.5em;">large</span> text.</span>'
            });
        }

        function consume_alert() {
            if (_alert) return;
            _alert = window.alert;
            window.alert = function(message) {
                new PNotify({
                    title: 'Alert',
                    text: message
                });
            };
        }

        function release_alert() {
            if (!_alert) return;
            window.alert = _alert;
            _alert = null;
        }

        function fake_load() {
            var cur_value = 1,
                progress;

            // Make a loader.
            var loader = new PNotify({
                title: "Creating series of tubes",
                text: '<div class="progress progress-striped active" style="margin:0">\
    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0">\
        <span class="sr-only">0%</span>\
    </div>\
</div>',
                //icon: 'fa fa-moon-o fa-spin',
                icon: 'fa fa-cog fa-spin',
                hide: false,
                buttons: {
                    closer: false,
                    sticker: false
                },
                history: {
                    history: false
                },
                before_open: function(notice){
                    progress = notice.get().find("div.progress-bar");
                    progress.width(cur_value+"%").attr("aria-valuenow", cur_value).find("span").html(cur_value+"%");
                    // Pretend to do something.
                    var timer = setInterval(function(){
                        if (cur_value == 70) {
                            loader.update({title: "Aligning discrete worms", icon: "fa fa-circle-o-notch fa-spin"});
                        }
                        if (cur_value == 80) {
                            loader.update({title: "Connecting end points", icon: "fa fa-refresh fa-spin"});
                        }
                        if (cur_value == 90) {
                            loader.update({title: "Dividing and conquering", icon: "fa fa-spinner fa-spin"});
                        }
                        if (cur_value >= 100) {
                            // Remove the interval.
                            window.clearInterval(timer);
                            loader.remove();
                            return;
                        }
                        cur_value += 1;
                        progress.width(cur_value+"%").attr("aria-valuenow", cur_value).find("span").html(cur_value+"%");
                    }, 65);
                }
            });
        }

        function dyn_notice() {
            var percent = 0;
            var notice = new PNotify({
                text: "Please Wait",
                type: 'info',
                icon: 'fa fa-spinner fa-spin',
                hide: false,
                buttons: {
                    closer: false,
                    sticker: false
                },
                opacity: .75,
                shadow: false,
                width: "170px"
            });

            setTimeout(function(){
                notice.update({title: false});
                var interval = setInterval(function(){
                    percent += 2;
                    var options = {
                        text: percent+"% complete."
                    };
                    if (percent == 80)
                        options.title = "Almost There";
                    if (percent >= 100) {
                        window.clearInterval(interval);
                        options.title = "Done!";
                        options.type = "success";
                        options.hide = true;
                        options.buttons = {
                            closer: true,
                            sticker: true
                        };
                        options.icon = 'fa fa-check';
                        options.opacity = 1;
                        options.shadow = true;
                        options.width = PNotify.prototype.options.width;
                    }
                    notice.update(options);
                }, 120);
            }, 2000);
        }

        /*********** Custom Stacks ***********
        * A stack is an object which PNotify uses to determine where
        * to position notices. A stack has two mandatory variables, dir1
        * and dir2. dir1 is the first direction in which the notices are
        * stacked. When the notices run out of room in the window, they
        * will move over in the direction specified by dir2. The directions
        * can be "up", "down", "right", or "left". Stacks are independent
        * of each other, so a stack doesn't know and doesn't care if it
        * overlaps (and blocks) another stack. The default stack, which can
        * be changed like any other default, goes down, then left. Stack
        * objects are used and manipulated by PNotify, and therefore,
        * should be a variable when passed. So, calling something like
        *
        * new PNotify({stack: {"dir1": "down", "dir2": "left"}});
        *
        * will **NOT** work. It will create a notice, but that notice will
        * be in its own stack and may overlap other notices.
        */
        var stack_topleft = {"dir1": "down", "dir2": "right", "push": "top"};
        var stack_bottomleft = {"dir1": "right", "dir2": "up", "push": "top"};
        var stack_custom = {"dir1": "right", "dir2": "down"};
        var stack_custom2 = {"dir1": "left", "dir2": "up", "push": "top"};
        var stack_bar_top = {"dir1": "down", "dir2": "right", "push": "top", "spacing1": 0, "spacing2": 0};
        var stack_bar_bottom = {"dir1": "up", "dir2": "right", "spacing1": 0, "spacing2": 0};
        /*********** Positioned Stack ***********
        * This stack is initially positioned through code instead of CSS.
        * This is done through two extra variables. firstpos1 and firstpos2
        * are pixel values, relative to a viewport edge. dir1 and dir2,
        * respectively, determine which edge. It is calculated as follows:
        *
        * - dir = "up" - firstpos is relative to the bottom of viewport.
        * - dir = "down" - firstpos is relative to the top of viewport.
        * - dir = "right" - firstpos is relative to the left of viewport.
        * - dir = "left" - firstpos is relative to the right of viewport.
        */
        var stack_bottomright = {"dir1": "up", "dir2": "left", "firstpos1": 25, "firstpos2": 25};

        function show_stack_topleft(type) {
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                addclass: "stack-topleft",
                stack: stack_topleft
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_bottomleft(type) {
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                addclass: "stack-bottomleft",
                stack: stack_bottomleft
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_bottomright(type) {
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                addclass: "stack-bottomright",
                stack: stack_bottomright
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_custom(type) {
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                addclass: "stack-custom",
                stack: stack_custom
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_custom2(type) {
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                addclass: "stack-custom2",
                stack: stack_custom2
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_bar_top(type) {
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                addclass: "stack-bar-top",
                cornerclass: "",
                width: "100%",
                stack: stack_bar_top
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_bar_bottom(type) {
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                addclass: "stack-bar-bottom",
                cornerclass: "",
                width: "70%",
                stack: stack_bar_bottom
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_context(type) {
            if (typeof stack_context === "undefined")
                stack_context = {"dir1": "down", "dir2": "left", "context": $("#stack-context")};
            var opts = {
                title: "Over Here",
                text: "Check me out. I'm in a different stack.",
                stack: stack_context
            };
            switch (type) {
                case 'error':
                    opts.title = "Oh No";
                    opts.text = "Watch out for that water tower!";
                    opts.type = "error";
                    break;
                case 'info':
                    opts.title = "Breaking News";
                    opts.text = "Have you met Ted?";
                    opts.type = "info";
                    break;
                case 'success':
                    opts.title = "Good News Everyone";
                    opts.text = "I've invented a device that bites shiny metal asses.";
                    opts.type = "success";
                    break;
            }
            new PNotify(opts);
        };
        function show_stack_info() {
            var modal_overlay;
            if (typeof info_box != "undefined") {
                info_box.open();
                return;
            }
            info_box = new PNotify({
                title: "PNotify Stacks",
                text: "Stacks are used to position notices and determine where new notices will go when they're created. Each notice that's placed into a stack will be positioned related to the other notices in that stack. There is no limit to the number of stacks, and no limit to the number of notices in each stack.",
                type: "info",
                icon: "fa fa-bars",
                hide: false,
                history: {
                    history: false
                },
                stack: false,
                after_open: function(notice){
                    // Position this notice in the center of the screen.
                    notice.get().css({
                        "top": ($(window).height() / 2) - (notice.get().height() / 2),
                        "left": ($(window).width() / 2) - (notice.get().width() / 2)
                    });
                    // Make a modal screen overlay.
                    if (modal_overlay) {
                        modal_overlay.appendTo("body").addClass("in");
                    } else {
                        modal_overlay = $("<div />", {
                            "class": "modal-backdrop fade"
                        }).appendTo("body").click(function(){
                            notice.remove();
                        }).addClass("in");
                    }
                },
                before_close: function(){
                    modal_overlay.removeClass("in");
                },
                after_close: function(){
                    modal_overlay.detach();
                }
            });
        };
    </script>

<div id="page" data-spy="scroll" data-target=".navbar">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="https://sciactive.com/pnotify/">PNotify</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#page">Overview</a></li>
                    <li><a href="#demos-simple">Simple Demos</a></li>
                    <li><a href="#demos-modules">Module Demos</a></li>
                    <li><a href="#stacks">Stacks</a></li>
                    <li><a href="#customization">Customization</a></li>
                    <li><a href="#comments">Comments</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Beyond PNotify <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="https://sciactive.com/" target="_blank">SciActive</a></li>
                            <li><a href="http://nymph.io/" target="_blank">Nymph</a></li>
                            <li class="divider"></li>
                            <li><a href="https://sciactive.com/pform/" target="_blank">PForm</a></li>
                            <li><a href="http://hookphp.org/" target="_blank">HookPHP</a></li>
                            <li><a href="http://requirephp.org/" target="_blank">RequirePHP</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div id="switcher-container">
        <div id="switcher-bootstrap" style="display: none;">
            <div class="btn-group">
                <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);">
                    Theme: <span id="bootstrap-current">Normal</span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">Normal</a></li>
                    <li class="divider"></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/cerulean/bootstrap.min.css">Cerulean</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/cosmo/bootstrap.min.css">Cosmo</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/cyborg/bootstrap.min.css">Cyborg</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/darkly/bootstrap.min.css">Darkly</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/flatly/bootstrap.min.css">Flatly</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/journal/bootstrap.min.css">Journal</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/lumen/bootstrap.min.css">Lumen</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/paper/bootstrap.min.css">Paper</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/readable/bootstrap.min.css">Readable</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/sandstone/bootstrap.min.css">Sandstone</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/simplex/bootstrap.min.css">Simplex</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/slate/bootstrap.min.css">Slate</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/spacelab/bootstrap.min.css">Spacelab</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/superhero/bootstrap.min.css">Superhero</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/united/bootstrap.min.css">United</a></li>
                    <li><a href="javascript:void(0);" data-theme="//maxcdn.bootstrapcdn.com/bootswatch/3.3.5/yeti/bootstrap.min.css">Yeti</a></li>
                    <li class="divider"></li>
                    <li><a href="http://bootswatch.com/" target="_blank">Themes by Bootswatch</a></li>
                </ul>
                <script type="text/javascript">
                    $(function(){
                        var reset = function(){
                            setTimeout(function(){
                                var y = $(".navbar").height() + 10;
                                $("#switcher-container").css('top', y+'px');
                            }, 500);
                        };
                        reset();
                        $('#switcher-bootstrap').on('click', 'a[data-theme]', function(){
                            var $this = $(this);
                            $('#bootstrap-current').text($this.text()); $('#bootstrap-css').attr('href', $this.attr('data-theme'));
                            reset();
                        });
                    });
                </script>
            </div>
        </div>
        <div id="switcher-jqueryui" style="display: none;"></div>
    </div>
    <section class="container page-banner">
        <div class="intro-section">
            <h1>PNotify</h1>
            <p id="description">Beautiful JavaScript notifications.</p>
        </div>
        <div class="intro-section">
            <a class="btn btn-primary btn-large" data-toggle="modal" href="#download">Download PNotify 2.2</a>
            <a class="right-button btn btn-default btn-large" href="https://github.com/sciactive/pnotify" target="_blank" title="Fork me on GitHub">PNotify on GitHub <img src="${path}/statics/assets/plugins/pnotify-master/includes/github-icon.png" alt="GitHub Icon" /></a>
        </div>
        <div class="intro-section">
            <a style="margin: 0 8px;" data-toggle="modal" href="#using">Using PNotify</a>
            <a style="margin: 0 8px;" href="https://github.com/sciactive/pnotify/issues/new" target="_blank">Bug Report/Feature Request</a>
        </div>
    </section>
    <div class="modal fade" id="download" tabindex="-1" role="dialog" aria-labelledby="download-title" aria-hidden="true" style="max-height: inherit;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="download-title">Download a PNotify Bundle</h4>
                </div>
                <div class="modal-body">
                    <div class="page-header" style="margin-top: 0;">
                        <h3 style="margin-top: 0;">Optional Styling</h3>
                    </div>
                    <div><label><input type="checkbox" data-type="module" name="brighttheme" checked /> Bright Theme</label></div>
                    <div style="margin-bottom: 10px;"><small>Stand-alone theme. You can uncheck this if you're using Bootstrap or jQuery UI.</small></div>
                    <div class="page-header">
                        <h3 style="margin-top: 0;">Modules</h3>
                    </div>
                    <div><label><input type="checkbox" data-type="module" name="desktop" checked /> Desktop</label></div>
                    <div style="margin-bottom: 10px;"><small>Notifications that display even when the web page is not visible.</small></div>
                    <div><label><input type="checkbox" data-type="module" name="buttons" checked /> Buttons</label></div>
                    <div style="margin-bottom: 10px;"><small>Sticker and a closer buttons.</small></div>
                    <div><label><input type="checkbox" data-type="module" name="nonblock" /> NonBlock</label></div>
                    <div style="margin-bottom: 10px;"><small>Click through to things underneath the notice.</small></div>
                    <div><label><input type="checkbox" data-type="module" name="mobile" checked /> Mobile</label></div>
                    <div style="margin-bottom: 10px;"><small>Notices on mobile phones and tablets.</small></div>
                    <div><label><input type="checkbox" data-type="module" name="animate" /> Animate</label></div>
                    <div style="margin-bottom: 10px;"><small>Fluid CSS animations using Animate.css. (Requires <a href="https://daneden.github.io/animate.css/" target="_blank">Animate.css</a>.)</small></div>
                    <div><label><input type="checkbox" data-type="module" name="confirm" /> Confirm</label></div>
                    <div style="margin-bottom: 10px;"><small>Confirmation dialogs and prompts.</small></div>
                    <div><label><input type="checkbox" data-type="module" name="callbacks" /> Callbacks</label></div>
                    <div style="margin-bottom: 10px;"><small>Manipulate the notice during its lifecycle.</small></div>
                    <div><label><input type="checkbox" data-type="module" name="history" /> History</label></div>
                    <div style="margin-bottom: 10px;"><small>Redisplay old notices.</small></div>
                    <div class="page-header">
                        <h3>Minification</h3>
                    </div>
                    <div><label><input type="checkbox" data-type="minify" name="minify" checked /> Minify the Script and Stylesheet</label></div>
                    <div><small>It is a good idea to enable this on production services, so you get faster transfer times.</small></div>
                </div>
                <div class="modal-footer">
                    <a class="btn btn-primary" data-href="https://sciactive.com/pnotify/buildcustom.php?mode=js{min}&amp;modules={modules}&amp;cff=.js" href="#">Get the JavaScript!</a>
                    <a class="btn btn-primary" data-href="https://sciactive.com/pnotify/buildcustom.php?mode=css{min}&amp;modules={modules}&amp;cff=.css" href="#">Get the CSS!</a>
                </div>
                <script type="text/javascript">
                    $(function(){
                        var changeFunction = function(){
                            var modules = [];
                            form.find("[data-type=module]:checked").each(function(){
                                modules.push($(this).attr("name"));
                            });
                            modules = modules.join("-");
                            var minify = !!form.find("[data-type=minify]:checked").length;
                            form.find("a[data-href]").each(function(){
                                $(this).attr("href", $(this).attr("data-href").replace("{min}", minify ? "&min=true" : "").replace("{modules}", modules));
                            });
                        };
                        var form = $("#download").on("click change", "input", changeFunction);
                        changeFunction();
                    });
                </script>
            </div>
        </div>
    </div>
    <div class="modal fade" id="using" tabindex="-1" role="dialog" aria-labelledby="using-title" aria-hidden="true" style="max-height: inherit;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="using-title">Using PNotify</h4>
                </div>
                <div class="modal-body">
                    <p>
                        PNotify downloads come with the following files:<br />
                        <br />
                        <code>pnotify.custom.js</code> or <code>pnotify.custom.min.js</code> (Minified)
                        <br />
                        <code>pnotify.custom.css</code> or <code>pnotify.custom.min.css</code> (Minified)
                    </p>
                    <p>
                        So here's how you'd include them on your page:
                    </p>
                    <pre class="prettyprint">&lt;script type="text/javascript" src="pnotify.custom<em>.min</em>.js"&gt;&lt;/script&gt;
&lt;link href="pnotify.custom<em>.min</em>.css" media="all" rel="stylesheet" type="text/css" /&gt;</pre>
                    <p>
                        You also need to include jQuery (1.6 or higher) and either Bootstrap CSS or a jQuery UI Theme.
                        <small>If you want to use jQuery UI effect animations, you also need to include the jQuery UI JavaScript.</small>
                    </p>
                    <p>
                        Now you can use PNotify like this:
                    </p>
                    <pre class="prettyprint">&lt;script type="text/javascript"&gt;
$(function(){
    new PNotify({
        title: 'Regular Notice',
        text: 'Check me out! I\'m a notice.'
    });
});
&lt;/script&gt;</pre>
                    <p>
                        If you are not using any UI library, you can use the
                        included styling, called Bright Theme. It is the default.
                    </p>
                    <p>
                        If you are using Bootstrap version 3, include this line
                        somewhere before your first notice:
                    </p>
                    <pre class="prettyprint">PNotify.prototype.options.styling = "bootstrap3";</pre>
                    <p>
                        If you are using jQuery UI, include this line somewhere
                        before your first notice:
                    </p>
                    <pre class="prettyprint">PNotify.prototype.options.styling = "jqueryui";</pre>
                    <p>
                        If you are using Bootstrap 3 with Font Awesome, include
                        this line somewhere before your first notice:
                    </p>
                    <pre class="prettyprint">PNotify.prototype.options.styling = "fontawesome";</pre>
                    <p>
                        All of the demos on this page provide source code with
                        the "See the source" dropdown,
                        <img style="margin-left: 3em;" src="${path}/statics/assets/plugins/pnotify-master/includes/source-screen.png" alt="Source button screen shot." />
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Ok, got it.</button>
                </div>
            </div>
        </div>
    </div>
    <section class="container page-points">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="alert-block">
                        <h3><i class="glyphicon glyphicon-book" style="position: relative; top: 3px;"></i> About</h3>
                        <p>
                            PNotify is a JavaScript notification system, developed
                            by <a href="http://sciactive.com">SciActive</a>.
                            <br />
                            <br />
                            PNotify provides desktop notifications based on the
                            <a href="http://www.w3.org/TR/notifications/" target="_blank">Web Notifications spec</a>.
                            If desktop notifications are not available or not allowed,
                            PNotify will fall back to displaying the notice as a
                            regular, in-browser notice.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="alert-block">
                        <h3><i class="glyphicon glyphicon-phone" style="position: relative; top: 3px;"></i> Mobile Ready</h3>
                        <p>
                            PNotify works on your phone and tablet. You can swipe
                            notices away to dismiss them.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="alert-block">
                        <h3><i class="glyphicon glyphicon-asterisk" style="position: relative; top: 3px;"></i> Unobtrusive</h3>
                        <p>
                            PNotify can provide <strong>non-blocking</strong> notices
                            that allow the user to click elements behind the notice without
                            even having to dismiss it.
                        </p>
                        <p>
                            <a class="btn btn-default" data-toggle="modal" href="#feature-modal" >See All Features</a>
                        </p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="alert-block">
                        <h3><i class="glyphicon glyphicon-picture" style="position: relative; top: 3px;"></i> Themeable</h3>
                        <p>
                            PNotify can use Bootstrap or jQuery UI themes. Try out some of the
                            readymade themes using the selector in the top right corner
                            of this page.
                        </p>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="alert-block">
                        <h3><i class="glyphicon glyphicon-gift" style="position: relative; top: 3px;"></i> Completely Open</h3>
                        <p>
                            PNotify is distributed under the
                            <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License, Version 2.0</a>.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row stable-note" style="display: none;">
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="alert alert-success">
                        <h3 style="margin-top: 0;"><i class="glyphicon glyphicon-info-sign" style="position: relative; top: 3px;"></i> Did you know?</h3>
                        <p>
                            This is the stable site. You can download code here that's
                            tested and proven to work. However, if you like to live
                            dangerously, you can also check out the
                            <a href="https://sciactive.github.com/pnotify">development site</a>.
                        </p>
                    </div>
                </div>
            </div>
            <div class="dev-note" style="display: none;">
                <div class="alert alert-danger" style="width: 50vw;">
                    <h3 style="margin-top: 0;"><i class="glyphicon glyphicon-exclamation-sign" style="position: relative; top: 3px;"></i> Caution warning danger attention!</h3>
                    <p>
                        This is the development site. It's a playground for
                        bleeding edge features and code that probably won't
                        work. The newer features listed in the download dialog
                        won't work.
                    </p>
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="feature-modal" tabindex="-1" role="dialog" aria-labelledby="feature-modal-title" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="feature-modal-title">PNotify Features</h4>
                </div>
                <div class="modal-body">
                    <ul>
                        <li>Rich graphical features and effects.
                            <ul>
                                <li>Bootstrap, Font Awesome, jQuery UI, and any other CSS based icons.</li>
                                <li>Mobile styling and swipe away support.</li>
                                <li>Timed hiding with visual effects.</li>
                                <li>Standard and custom effects.</li>
                                <li>Add custom classes for individual notice styling.</li>
                                <li>Variable opacity.</li>
                                <li>Optional drop shadows.</li>
                            </ul>
                        </li>
                        <li>Highly customizable UI.
                            <ul>
                                <li>Sticky (no automatic hiding) notices.</li>
                                <li>Optional hide and sticker buttons.</li>
                                <li>Non-blocking notices for less intrusive use.</li>
                                <li>Three notification types: notice, info, and error.</li>
                                <li>Stacks allow notice sets to stack independently.
                                    <ul>
                                        <li>Control stack direction and push to top or bottom.</li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li>Feature rich API.
                            <ul>
                                <li>Desktop notifications based on the draft Web Notifications standard.</li>
                                <li>Supports dynamically updating text, title, icon, type...</li>
                                <li>Supports HTML (including forms) in title and text.
                                    <ul>
                                        <li>Can also escape HTML to prevent XSS attack.</li>
                                    </ul>
                                </li>
                                <li>Callbacks for various events, which can cancel said events.</li>
                                <li>History viewer allows user to review previous notices.</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix">&nbsp;</div>
    <div id="demos-simple" class="container page-section">
        <div class="page-header">
            <h1>Simple Demos <small>These demos only use core PNotify features.</small></h1>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Choose the Styling</h3>
            </div>
            <div class="panel-body">
                PNotify supports three styling methods and three popular icon sets.
                <div class="btn-toolbar">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-default active">
                            <input type="radio" name="styling" id="style-brighttheme" autocomplete="off" checked> Bright Theme
                        </label>
                        <label class="btn btn-default">
                            <input type="radio" name="styling" id="style-bootstrap3" autocomplete="off"> Bootstrap
                        </label>
                        <label class="btn btn-default">
                            <input type="radio" name="styling" id="style-fontawesome" autocomplete="off"> Font Awesome Icons
                        </label>
                        <label class="btn btn-default">
                            <input type="radio" name="styling" id="style-jqueryui" autocomplete="off"> jQuery UI
                        </label>
                    </div>
                    <button class="btn btn-default source" onclick="new PNotify({
                        title: 'Bright Theme Notice',
                        text: 'Look at my beautiful styling! ^_^',
                        styling: 'brighttheme'
                    });
                    new PNotify({
                        title: 'Bright Theme Info',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'info',
                        styling: 'brighttheme'
                    });
                    new PNotify({
                        title: 'Bright Theme Success',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'success',
                        styling: 'brighttheme'
                    });
                    new PNotify({
                        title: 'Bright Theme Error',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'error',
                        styling: 'brighttheme'
                    });
                    new PNotify({
                        title: 'Bootstrap Notice',
                        text: 'Look at my beautiful styling! ^_^',
                        styling: 'bootstrap3'
                    });
                    new PNotify({
                        title: 'Bootstrap Info',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'info',
                        styling: 'bootstrap3'
                    });
                    new PNotify({
                        title: 'Bootstrap Success',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'success',
                        styling: 'bootstrap3'
                    });
                    new PNotify({
                        title: 'Bootstrap Error',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'error',
                        styling: 'bootstrap3'
                    });
                    new PNotify({
                        title: 'Font Awesome Notice',
                        text: 'Look at my beautiful styling! ^_^',
                        styling: 'fontawesome'
                    });
                    new PNotify({
                        title: 'Font Awesome Info',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'info',
                        styling: 'fontawesome'
                    });
                    new PNotify({
                        title: 'Font Awesome Success',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'success',
                        styling: 'fontawesome'
                    });
                    new PNotify({
                        title: 'Font Awesome Error',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'error',
                        styling: 'fontawesome'
                    });
                    new PNotify({
                        title: 'jQuery UI Notice',
                        text: 'Look at my beautiful styling! ^_^',
                        styling: 'jqueryui'
                    });
                    new PNotify({
                        title: 'jQuery UI Info',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'info',
                        styling: 'jqueryui'
                    });
                    new PNotify({
                        title: 'jQuery UI Success',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'success',
                        styling: 'jqueryui'
                    });
                    new PNotify({
                        title: 'jQuery UI Error',
                        text: 'Look at my beautiful styling! ^_^',
                        type: 'error',
                        styling: 'jqueryui'
                    });">Demo Each</button>
                </div>
            </div>
            <script type="text/javascript">
                $(function(){
                    $("input[name=styling]").change(function(){
                        switch ($("input[name=styling]:checked").attr("id")) {
                            case "style-brighttheme":
                                PNotify.prototype.options.styling = "brighttheme";
                                $("#switcher-bootstrap").hide();
                                $("#switcher-jqueryui").hide();
                                $(".brighttheme-hideme").hide();
                                new PNotify({
                                    title: "Styling Change",
                                    text: "From now on, notices will be styled with Bright Theme, the stand alone theme."
                                });
                                break;
                            case "style-bootstrap3":
                                PNotify.prototype.options.styling = "bootstrap3";
                                $("#switcher-bootstrap").show();
                                $("#switcher-jqueryui").hide();
                                $(".brighttheme-hideme").show();
                                new PNotify({
                                    title: "Styling Change",
                                    text: "From now on, notices will be styled with Twitter Bootstrap."
                                });
                                break;
                            case "style-jqueryui":
                                PNotify.prototype.options.styling = "jqueryui";
                                $("#switcher-jqueryui").show();
                                $("#switcher-bootstrap").hide();
                                $(".brighttheme-hideme").show();
                                new PNotify({
                                    title: "Styling Change",
                                    text: "From now on, notices will be styled with jQuery UI."
                                });
                                break;
                            case "style-fontawesome":
                                PNotify.prototype.options.styling = "fontawesome";
                                $("#switcher-jqueryui").hide();
                                $("#switcher-bootstrap").show();
                                $(".brighttheme-hideme").show();
                                new PNotify({
                                    title: "Styling Change",
                                    text: "From now on, notices will be styled with Bootstrap w/ Font Awesome Icons."
                                });
                                break;
                        }
                    });
                });
            </script>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">PNotify Core</h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Regular Notice',
                    text: 'Check me out! I\'m a notice.'
                });">Regular Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Bootstrap Icon',
                    text: 'I have an icon that uses the Bootstrap icon styles.',
                    icon: 'glyphicon glyphicon-envelope'
                });">Bootstrap Icon Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Font Awesome Icon',
                    text: 'I have an icon that uses the Font Awesome icon styles.',
                    icon: 'fa fa-envelope-o'
                });">Font Awesome Icon Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'jQuery UI Icon',
                    text: 'I have an icon that uses the jQuery UI icon styles.',
                    icon: 'ui-icon ui-icon-mail-closed'
                });">jQuery UI Icon Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Icon Notice',
                    text: 'I have no icon.',
                    icon: false
                });">No Icon Notice</button>
                <hr />
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'New Thing',
                    text: 'Just to let you know, something happened.',
                    type: 'info'
                });">Regular Info</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'jQuery UI Icon Info',
                    text: 'Something is encrypted. Check out my icon, it shows that you\'re secure because our encryption uses padlocks.',
                    type: 'info',
                    icon: 'ui-icon ui-icon-locked'
                });">jQuery UI Icon Info</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Icon Info',
                    text: 'I have no icon.',
                    type: 'info',
                    icon: false
                });">No Icon Info</button>
                <hr />
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Regular Success',
                    text: 'That thing that you were trying to do worked!',
                    type: 'success'
                });">Regular Success</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'jQuery UI Icon Success',
                    text: 'We reached the moon first! See, we planted a flag.',
                    type: 'success',
                    icon: 'ui-icon ui-icon-flag'
                });">jQuery UI Icon Success</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Icon Success',
                    text: 'I have no icon.',
                    type: 'success',
                    icon: false
                });">No Icon Success</button>
                <hr />
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Oh No!',
                    text: 'Something terrible happened.',
                    type: 'error'
                });">Regular Error</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'jQuery UI Icon Error',
                    text: 'Oh no. Something\'s wrong with your network, and I\'m showing you visually using an appropriate icon to indicate the type of error that has occured. You know, network.',
                    type: 'error',
                    icon: 'ui-icon ui-icon-signal-diag'
                });">jQuery UI Icon Error</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Icon Error',
                    text: 'I have no icon.',
                    type: 'error',
                    icon: false
                });">No Icon Error</button>
                <hr />
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'See Through Notice',
                    text: 'No one ever pays attention to me. Why should they? I\'m practically invisible.',
                    addclass: 'translucent'
                });
                var source_note = 'translucent is a custom class defined (using ui-pnotify-fade-in) with opacity: .8.';">Translucent Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Shadow Notice',
                    text: 'I don\'t have a shadow. (It\'s cause I\'m a vampire or something. Or is that reflections...)',
                    shadow: false
                });">No Shadow Notice</button>
                <button class="btn btn-default source" onclick="new PNotify('Check me out! I\'m a notice.');">Simple Notice</button>
                <button class="btn btn-default source" onclick="new PNotify(Math.round(Math.random()*9999));">Number Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Mouse Reset Notice',
                    text: 'I don\'t care if you move your mouse over me, I\'ll disappear when I want.',
                    mouse_reset: false
                });">No Mouse Reset Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Fast Fading Notice',
                    text: 'I fade in and out really quickly.',
                    animate_speed: 'fast'
                });">Fast Fading Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Effect Notice',
                    text: 'I don\'t even bother to animate. I\'m too cool for that.',
                    animation: 'none'
                });">No Effect Notice</button>
                <button class="btn btn-default source" onclick="var notice = new PNotify({
                    text: $('#form_notice').html(),
                    icon: false,
                    width: 'auto',
                    hide: false,
                    buttons: {
                        closer: false,
                        sticker: false
                    },
                    insert_brs: false
                });
                notice.get().find('form.pf-form').on('click', '[name=cancel]', function(){
                    notice.remove();
                }).submit(function(){
                    var username = $(this).find('input[name=username]').val();
                    if (!username) {
                        alert('Please provide a username.');
                        return false;
                    }
                    notice.update({
                        title: 'Welcome',
                        text: 'Successfully logged in as '+username,
                        icon: true,
                        width: PNotify.prototype.options.width,
                        hide: true,
                        buttons: {
                            closer: true,
                            sticker: true
                        },
                        type: 'success'
                    });
                    return false;
                });">Form Notice</button>
                <div id="form_notice" style="display: none;">
                    <form class="pf-form pform_custom" action="" method="post">
                        <div class="pf-element pf-heading">
                            <h3 style="margin-top: 0;">Login to Continue</h3>
                            <p>Just an example.</p>
                        </div>
                        <div class="pf-element">
                            <label>
                                <span class="pf-label">Username</span>
                                <input class="pf-field form-control" type="text" name="username" />
                            </label>
                        </div>
                        <div class="pf-element">
                            <label>
                                <span class="pf-label">Password</span>
                                <input class="pf-field form-control" type="password" name="password" />
                            </label>
                        </div>
                        <div class="pf-element">
                            <label>
                                <span class="pf-label">Remember Me</span>
                                <span class="pf-note">Lasts for 2 weeks.</span>
                                <input class="pf-field" type="checkbox" name="remember" />
                            </label>
                        </div>
                        <div class="pf-element pf-buttons pf-centered">
                            <input class="pf-button btn btn-primary" type="submit" name="submit" value="Submit" />
                            <input class="pf-button btn btn-default" type="button" name="cancel" value="Cancel" />
                        </div>
                    </form>
                </div>
                <button class="btn btn-default source" onclick="var notice = new PNotify({
                    title: 'Click Notice',
                    text: 'I wish someone would click me.'
                });
                notice.get().css('cursor', 'pointer').click(function(e){
                    if ($(e.target).is('.ui-pnotify-closer *, .ui-pnotify-sticker *'))
                        return;
                    notice.update({type: 'success', text: 'Yay, you clicked me!&lt;div style=&quot;text-align: center;&quot;&gt;&lt;img src=&quot;https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Happy_smiley_face.png/240px-Happy_smiley_face.png&quot; /&gt;&lt;/div&gt;'});
                });">Click Notice</button>
                <button class="btn btn-default source" onclick="var notice = new PNotify({
                    title: 'Click Close Notice',
                    text: 'Click me anywhere to dismiss me.',
                    buttons: {
                        closer: false,
                        sticker: false
                    }
                });
                notice.get().click(function(){
                    notice.remove();
                });">Click Close Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Big Notice',
                    text: 'Check me out! I\'m tall and wide, even though my text isn\'t.',
                    width: '500px',
                    min_height: '400px'
                });">Big Notice</button>
                <button class="btn btn-default source" onclick="show_rich();">Rich Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: '&lt;em&gt;Escaped Notice&lt;/em&gt;',
                    title_escape: true,
                    text: $('#evil_html').html(),
                    text_escape: true
                });">Escaped Notice</button>
                <div id="evil_html" style="display: none;">
                    <div>As you can see, I don't allow HTML in my content.</div>
                    <div>This prevents things like cross site scripting attacks:</div>
                    <script type="text/javascript">
                        (function(){
                            // Here would be the XSS attack.
                        })()
                    </script>
                </div>
                <button class="btn btn-default source" onclick="dyn_notice();">Dynamic Notice</button>
                <button class="btn btn-default source brighttheme-hideme" style="display: none;" onclick="new PNotify({
                    title: 'No Rounded Corners Notice',
                    text: 'Warning: Contains sharp objects. Not suitable for browsers under the age of CSS3.',
                    cornerclass: 'ui-pnotify-sharp'
                });">No Rounded Corners</button>
                <hr />
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Custom Styling',
                    text: 'I have an additional class that\'s used to give me special styling. I always wanted to be pretty. I also use the nonblock module.',
                    addclass: 'custom',
                    icon: 'fa fa-file-image-o',
                    opacity: .8,
                    nonblock: {
                        nonblock: true
                    }
                });">Custom Styled Notice</button>
                <div style="float: right;"><a data-toggle="modal" href="#growl">How to style like Growl.</a></div>
                <div class="modal fade" id="growl" tabindex="-1" role="dialog" aria-labelledby="growl-title" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="growl-title">Styling Notices Like Growl</h4>
                            </div>
                            <div class="modal-body">
                                <p>
                                    To custom style a notice, you need to use a
                                    class. For this example, we'll use "<strong>custom</strong>".
                                </p>
                                <p>
                                    Here's some CSS to make custom notices look like
                                    Apple Growl:
                                </p>
                                <pre class="prettyprint lang-css" style="min-width: 100%;">.ui-pnotify<strong>.custom</strong> .ui-pnotify-container {
background-color: #404040 !important;
background-image: none !important;
border: none !important;
-moz-border-radius: 10px;
-webkit-border-radius: 10px;
border-radius: 10px;
}
.ui-pnotify<strong>.custom</strong> .ui-pnotify-title, .ui-pnotify<strong>.custom</strong> .ui-pnotify-text {
font-family: Arial, Helvetica, sans-serif !important;
text-shadow: 2px 2px 3px black !important;
font-size: 10pt !important;
color: #FFF !important;
padding-left: 50px !important;
line-height: 1 !important;
text-rendering: geometricPrecision !important;
}
.ui-pnotify<strong>.custom</strong> .ui-pnotify-title {
font-weight: bold;
}
.ui-pnotify<strong>.custom</strong> .ui-pnotify-icon {
float: left;
}
.ui-pnotify<strong>.custom</strong> .fa {
margin: 3px;
width: 33px;
height: 33px;
font-size: 33px;
color: #FF0;
}</pre>
                                <p>
                                    And here's the JavaScript to use this styling:
                                </p>
                                <pre class="prettyprint" style="min-width: 100%;">new PNotify({
    title: 'Custom Styling',
    text: 'I have an additional class that\'s used to give me special styling. I always wanted to be pretty.',
    <strong>addclass: 'custom'</strong>,
    icon: 'fa fa-file-image-o',
    opacity: .8,
    nonblock: {
        nonblock: true
    }
});</pre>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Ok, got it.</button>
                            </div>
                        </div>
                    </div>
                </div>
                <hr style="clear: both;" />
                <button class="btn btn-default source" onclick="PNotify.removeAll();">Remove All Notices</button>
            </div>
        </div>
    </div>

    <div id="web-notifications"></div>
    <div id="demos-modules" class="container page-section">
        <div class="page-header">
            <h1>Module Demos</h1>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <div style="float: right;">Implements the <a href="http://www.w3.org/TR/notifications/" target="_blank">Web Notifications spec</a>.</div>
                <h3 class="panel-title">Desktop Module <small>Notifications that display even when the web page is not visible.</small></h3>
            </div>
            <div class="panel-body">
                <p>
                    The first time you click one of these buttons, you will be asked to grant permission for this site to show notices. Then you can click them again to see the desktop notification.
                </p>
                <p>
                    If your browser doesn't support Web Notifications, or you deny permission to show them, you will only see regular in-browser notices. You can check <a href="http://caniuse.com/notifications" target="_blank">here</a>.
                </p>
                <hr />
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); (new PNotify({
                    title: 'Desktop Notice',
                    text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
                    desktop: {
                        desktop: true
                    }
                })).get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                });">Desktop Notification Notice</button>
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); (new PNotify({
                    title: 'Desktop Info',
                    text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
                    type: 'info',
                    desktop: {
                        desktop: true
                    }
                })).get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                });">Desktop Notification Info</button>
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); (new PNotify({
                    title: 'Desktop Success',
                    text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
                    type: 'success',
                    desktop: {
                        desktop: true
                    }
                })).get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                });">Desktop Notification Success</button>
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); (new PNotify({
                    title: 'Desktop Error',
                    text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
                    type: 'error',
                    desktop: {
                        desktop: true
                    }
                })).get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                });">Desktop Notification Error</button>
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); (new PNotify({
                    title: 'Desktop Custom Icon',
                    text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
                    desktop: {
                        desktop: true,
                        icon: 'includes/le_happy_face_by_luchocas-32.png'
                    }
                })).get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                });">Desktop Notification Custom</button>
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); (new PNotify({
                    title: 'Sticky Desktop Notice',
                    text: 'I\'m a sticky notice, so you\'ll have to close me yourself. (Some systems don\'t allow sticky notifications.) If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
                    hide: false,
                    desktop: {
                        desktop: true
                    }
                })).get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                });">Sticky Desktop Notification</button>
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); var notice = (new PNotify({
                    title: 'Dynamic Desktop Notice',
                    text: 'I\'m a dynamic desktop notice. I\'ll change my type and text in a few seconds. If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I\'ll still appear as a regular PNotify notice.',
                    desktop: {
                        desktop: true
                    }
                })); notice.get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                }); setTimeout(function(){
                    notice.update({
                        type: 'info',
                        text: 'Now I\'m an info box!'
                    });
                }, 4000);">Dynamic Desktop Notification</button>
                <button class="btn btn-default source" onclick="PNotify.desktop.permission(); (new PNotify({
                    title: 'Desktop Notice',
                    text: 'If you\'ve given me permission, I\'ll appear as a desktop notification. If you haven\'t, I won\'t appear at all, because my fallback is turned off.',
                    desktop: {
                        desktop: true,
                        fallback: false
                    }
                })).get().click(function(e){
                    if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target))
                        return;
                    alert('Hey! You clicked the desktop notification!');
                });" title="Disabling fallback makes the notice not appear at all if it can't appear as a desktop notice.">No Fallback Desktop Notice</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Buttons Module <small>Sticker and a closer buttons.</small></h3>
            </div>
            <div class="panel-body">
                <div class="alert alert-info">Since the Buttons module provides buttons by default, many of the demos on this page include the buttons.</div>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Sticky Notice',
                    text: 'Check me out! I\'m a sticky notice. You\'ll have to close me yourself.',
                    hide: false
                });">Sticky Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Sticky Info',
                    text: 'Sticky info, you know, like a newspaper covered in honey.',
                    type: 'info',
                    hide: false
                });">Sticky Info</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Sticky Success',
                    text: 'Sticky success... I\'m not even gonna make a joke.',
                    type: 'success',
                    hide: false
                });">Sticky Success</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Uh Oh!',
                    text: 'Something really terrible happened. You really need to read this, so I won\'t close automatically.',
                    type: 'error',
                    hide: false
                });">Sticky Error</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Sticky Button Notice',
                    text: 'Check me out! I\'m a sticky notice with no unsticky button. You\'ll have to close me yourself.',
                    hide: false,
                    buttons: {
                        sticker: false
                    }
                });">No Sticky Button</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Permanent Buttons Notice',
                    text: 'My buttons are really lonely, so they\'re gonna hang out with us.',
                    buttons: {
                        closer_hover: false,
                        sticker_hover: false
                    }
                });">Permanent Buttons</button>
                <button class="btn btn-default source" onclick="if (permanotice) {
                    permanotice.open();
                } else {
                    permanotice = new PNotify({
                        title: 'Now Look Here',
                        text: 'There\'s something you need to know, and I won\'t go away until you come to grips with it.',
                        hide: false,
                        buttons: {
                            closer: false,
                            sticker: false
                        },
                        mobile: {
                            swipe_dismiss: false
                        }
                    });
                }">Permanotice</button>
                <button class="btn btn-default source" onclick="if (permanotice.remove) permanotice.remove();">Remove Permanotice</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">NonBlock Module <small>Click through to things underneath the notice.</small></h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Non-Blocking Notice',
                    text: 'I\'m a special kind of notice called &quot;non-blocking&quot;. When you hover over me I\'ll fade to show the elements underneath. Feel free to click any of them just like I wasn\'t even here.\n\nNote: HTML links don\'t trigger in some browsers, due to security settings.',
                    nonblock: {
                        nonblock: true,
                        nonblock_opacity: .2
                    }
                });">Non-Blocking Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Non-Blocking Notice',
                    text: 'I\'m a non-blocking notice with buttons.',
                    nonblock: {
                        nonblock: true,
                        nonblock_opacity: .2
                    },
                    buttons: {
                        show_on_nonblock: true
                    }
                });">Non-Blocking Notice with Buttons</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Mobile Module <small>Notices on mobile phones and tablets.</small></h3>
            </div>
            <div class="panel-body">
                <div class="alert alert-info">Since the Mobile module provides support by default, most of the demos on this page work on mobile.</div>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Mobile Support Notice',
                    text: 'If you\'re on a mobile device, I won\'t respond to your swipes.',
                    mobile: {
                        swipe_dismiss: false
                    }
                });">No Mobile Support Notice</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No Mobile Styling Notice',
                    text: 'If you\'re on a mobile device, I\'ll look terrible.',
                    mobile: {
                        styling: false
                    }
                });">No Mobile Styling Notice</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Animate Module <small>Fluid CSS animations using <a href="https://daneden.github.io/animate.css/" target="_blank">Animate.css</a>.</small></h3>
            </div>
            <div class="panel-body">
                Some good looking presets:<br />
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Animate.css Effect',
                        text: 'I use effects from Animate.css. Such smooth CSS3 transitions make me feel like butter.',
                        animate: {
                            animate: true,
                            in_class: 'slideInDown',
                            out_class: 'slideOutUp'
                        }
                    });
                ">From the top!</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Animate.css Effect',
                        text: 'I use effects from Animate.css. Such smooth CSS3 transitions make me feel like butter.',
                        animate: {
                            animate: true,
                            in_class: 'zoomInLeft',
                            out_class: 'zoomOutRight'
                        }
                    });
                ">Zoom, Zoom</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Animate.css Effect',
                        text: 'I use effects from Animate.css. Such smooth CSS3 transitions make me feel like butter.',
                        animate: {
                            animate: true,
                            in_class: 'rotateInDownLeft',
                            out_class: 'rotateOutUpRight'
                        }
                    });
                ">Shuffling Cards</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Animate.css Effect',
                        text: 'I use effects from Animate.css. Such smooth CSS3 transitions make me feel like butter.',
                        animate: {
                            animate: true,
                            in_class: 'bounceInLeft',
                            out_class: 'bounceOutRight'
                        }
                    });
                ">Zippy</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Animate.css Effect',
                        text: 'I use effects from Animate.css. Such smooth CSS3 transitions make me feel like butter.',
                        animate: {
                            animate: true,
                            in_class: 'bounceInDown',
                            out_class: 'hinge'
                        }
                    });
                ">Off the Handle</button>
                <br /><br />
                Or build your own:<br />
                Effect in
                <select id="animate_in" class="form-control" style="display: inline; width: auto;">
                    <option value="bounceIn">bounceIn</option>
                    <option value="bounceInDown">bounceInDown</option>
                    <option value="bounceInLeft">bounceInLeft</option>
                    <option value="bounceInRight">bounceInRight</option>
                    <option value="bounceInUp">bounceInUp</option>
                    <option value="fadeIn">fadeIn</option>
                    <option value="fadeInDown">fadeInDown</option>
                    <option value="fadeInDownBig">fadeInDownBig</option>
                    <option value="fadeInLeft">fadeInLeft</option>
                    <option value="fadeInLeftBig">fadeInLeftBig</option>
                    <option value="fadeInRight">fadeInRight</option>
                    <option value="fadeInRightBig">fadeInRightBig</option>
                    <option value="fadeInUp">fadeInUp</option>
                    <option value="fadeInUpBig">fadeInUpBig</option>
                    <option value="flipInX">flipInX</option>
                    <option value="flipInY">flipInY</option>
                    <option value="lightSpeedIn">lightSpeedIn</option>
                    <option value="rotateIn">rotateIn</option>
                    <option value="rotateInDownLeft">rotateInDownLeft</option>
                    <option value="rotateInDownRight">rotateInDownRight</option>
                    <option value="rotateInUpLeft">rotateInUpLeft</option>
                    <option value="rotateInUpRight">rotateInUpRight</option>
                    <option value="rollIn">rollIn</option>
                    <option value="zoomIn">zoomIn</option>
                    <option value="zoomInDown">zoomInDown</option>
                    <option value="zoomInLeft">zoomInLeft</option>
                    <option value="zoomInRight">zoomInRight</option>
                    <option value="zoomInUp">zoomInUp</option>
                    <option value="slideInDown">slideInDown</option>
                    <option value="slideInLeft">slideInLeft</option>
                    <option value="slideInRight">slideInRight</option>
                    <option value="slideInUp">slideInUp</option>
                </select>
                Effect out
                <select id="animate_out" class="form-control" style="display: inline; width: auto;">
                    <option value="bounceOut">bounceOut</option>
                    <option value="bounceOutDown">bounceOutDown</option>
                    <option value="bounceOutLeft">bounceOutLeft</option>
                    <option value="bounceOutRight">bounceOutRight</option>
                    <option value="bounceOutUp">bounceOutUp</option>
                    <option value="fadeOut">fadeOut</option>
                    <option value="fadeOutDown">fadeOutDown</option>
                    <option value="fadeOutDownBig">fadeOutDownBig</option>
                    <option value="fadeOutLeft">fadeOutLeft</option>
                    <option value="fadeOutLeftBig">fadeOutLeftBig</option>
                    <option value="fadeOutRight">fadeOutRight</option>
                    <option value="fadeOutRightBig">fadeOutRightBig</option>
                    <option value="fadeOutUp">fadeOutUp</option>
                    <option value="fadeOutUpBig">fadeOutUpBig</option>
                    <option value="flipOutX">flipOutX</option>
                    <option value="flipOutY">flipOutY</option>
                    <option value="lightSpeedOut">lightSpeedOut</option>
                    <option value="rotateOut">rotateOut</option>
                    <option value="rotateOutDownLeft">rotateOutDownLeft</option>
                    <option value="rotateOutDownRight">rotateOutDownRight</option>
                    <option value="rotateOutUpLeft">rotateOutUpLeft</option>
                    <option value="rotateOutUpRight">rotateOutUpRight</option>
                    <option value="hinge">hinge</option>
                    <option value="rollOut">rollOut</option>
                    <option value="zoomOut">zoomOut</option>
                    <option value="zoomOutDown">zoomOutDown</option>
                    <option value="zoomOutLeft">zoomOutLeft</option>
                    <option value="zoomOutRight">zoomOutRight</option>
                    <option value="zoomOutUp">zoomOutUp</option>
                    <option value="slideOutDown">slideOutDown</option>
                    <option value="slideOutLeft">slideOutLeft</option>
                    <option value="slideOutRight">slideOutRight</option>
                    <option value="slideOutUp">slideOutUp</option>
                </select>
                <br />
                <button class="btn btn-default source" onclick="
                    var animate_in = $('#animate_in').val(),
                        animate_out = $('#animate_out').val();
                    new PNotify({
                        title: 'Animate.css Effect',
                        text: 'I use effects from Animate.css. Such smooth CSS3 transitions make me feel like butter.',
                        animate: {
                            animate: true,
                            in_class: animate_in,
                            out_class: animate_out
                        }
                    });
                ">Notify!</button>
                <br /><br />
                Attention seekers:<br />
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Bounce!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('bounce');
                            });
                        }
                    });
                ">Bounce</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Flash!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('flash');
                            });
                        }
                    });
                ">Flash</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Pulse!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('pulse');
                            });
                        }
                    });
                ">Pulse</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Rubber Band!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('rubberBand');
                            });
                        }
                    });
                ">Rubber Band</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Shake!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('shake');
                            });
                        }
                    });
                ">Shake</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Swing!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('swing');
                            });
                        }
                    });
                ">Swing</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Tada!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('tada');
                            });
                        }
                    });
                ">Tada</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Wobble!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('wobble');
                            });
                        }
                    });
                ">Wobble</button>
                <button class="btn btn-default source" onclick="
                    new PNotify({
                        title: 'Attention Seeker',
                        text: 'Click the button to see how you can highlight the notice with the Animate module:&lt;br&gt;&lt;button class=\'btn btn-default pull-right\'&gt;Jello!&lt;/button&gt;',
                        after_init: function(notice){
                            notice.elem.on('click', 'button', function(){
                                notice.attention('jello');
                            });
                        }
                    });
                ">Jello</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Confirm Module <small>Confirmation dialogs and prompts.</small></h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" onclick="(new PNotify({
                    title: 'Confirmation Needed',
                    text: 'Are you sure?',
                    icon: 'glyphicon glyphicon-question-sign',
                    hide: false,
                    confirm: {
                        confirm: true
                    },
                    buttons: {
                        closer: false,
                        sticker: false
                    },
                    history: {
                        history: false
                    }
                })).get().on('pnotify.confirm', function(){
                    alert('Ok, cool.');
                }).on('pnotify.cancel', function(){
                    alert('Oh ok. Chicken, I see.');
                });">Confirm Dialog</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Choose a Side',
                    text: 'You have three options to choose from.',
                    icon: 'glyphicon glyphicon-question-sign',
                    hide: false,
                    confirm: {
                        confirm: true,
                        buttons: [
                            {
                                text: 'Fries',
                                addClass: 'btn-primary',
                                click: function(notice){
                                    notice.update({
                                        title: 'You\'ve Chosen a Side', text: 'You want fries.', icon: true, type: 'info', hide: true,
                                        confirm: {
                                            confirm: false
                                        },
                                        buttons: {
                                            closer: true,
                                            sticker: true
                                        }
                                    });
                                }
                            },
                            {
                                text: 'Mash',
                                click: function(notice){
                                    notice.update({
                                        title: 'You\'ve Chosen a Side', text: 'You want mashed potatoes.', icon: true, type: 'info', hide: true,
                                        confirm: {
                                            confirm: false
                                        },
                                        buttons: {
                                            closer: true,
                                            sticker: true
                                        }
                                    });
                                }
                            },
                            {
                                text: 'Fruit',
                                click: function(notice){
                                    notice.update({
                                        title: 'You\'ve Chosen a Side', text: 'You want fruit.', icon: true, type: 'info', hide: true,
                                        confirm: {
                                            confirm: false
                                        },
                                        buttons: {
                                            closer: true,
                                            sticker: true
                                        }
                                    });
                                }
                            }
                        ]
                    },
                    buttons: {
                        closer: false,
                        sticker: false
                    },
                    history: {
                        history: false
                    }
                });">Custom Buttons</button>
                <button class="btn btn-default source" onclick="(new PNotify({
                    title: 'Input Needed',
                    text: 'What side would you like?',
                    icon: 'glyphicon glyphicon-question-sign',
                    hide: false,
                    confirm: {
                        prompt: true
                    },
                    buttons: {
                        closer: false,
                        sticker: false
                    },
                    history: {
                        history: false
                    }
                })).get().on('pnotify.confirm', function(e, notice, val){
                    notice.cancelRemove().update({
                        title: 'You\'ve Chosen a Side', text: 'You want '+$('<div/>').text(val).html()+'.', icon: true, type: 'info', hide: true,
                        confirm: {
                            prompt: false
                        },
                        buttons: {
                            closer: true,
                            sticker: true
                        }
                    });
                }).on('pnotify.cancel', function(e, notice){
                    notice.cancelRemove().update({
                        title: 'You Don\'t Want a Side', text: 'No soup for you!', icon: true, type: 'info', hide: true,
                        confirm: {
                            prompt: false
                        },
                        buttons: {
                            closer: true,
                            sticker: true
                        }
                    });
                });">Prompt Dialog</button>
                <button class="btn btn-default source" onclick="(new PNotify({
                    title: 'Input Needed',
                    text: 'Write me a poem, please.',
                    icon: 'glyphicon glyphicon-question-sign',
                    hide: false,
                    confirm: {
                        prompt: true,
                        prompt_multi_line: true,
                        prompt_default: 'Roses are red,\nViolets are blue,\n'
                    },
                    buttons: {
                        closer: false,
                        sticker: false
                    },
                    history: {
                        history: false
                    }
                })).get().on('pnotify.confirm', function(e, notice, val){
                    notice.cancelRemove().update({
                        title: 'Your Poem', text: $('<div/>').text(val).html(), icon: true, type: 'info', hide: true,
                        confirm: {
                            prompt: false
                        },
                        buttons: {
                            closer: true,
                            sticker: true
                        }
                    });
                }).on('pnotify.cancel', function(e, notice){
                    notice.cancelRemove().update({
                        title: 'You Don\'t Like Poetry', text: 'Roses are dead,\nViolets are dead,\nI suck at gardening.', icon: true, type: 'info', hide: true,
                        confirm: {
                            prompt: false
                        },
                        buttons: {
                            closer: true,
                            sticker: true
                        }
                    });
                });">Multi Line Prompt Dialog</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Callbacks Module <small>Manipulate the notice during its lifecycle.</small></h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" onclick="var dont_alert = function(){};
                new PNotify({
                    title: 'I\'m Here',
                    text: 'I have a callback for each of my events. I\'ll call all my callbacks while I change states.',
                    before_init: function(opts){
                        alert('I\'m called before the notice initializes. I\'m passed the options used to make the notice. I can modify them. Watch me replace the word callback with tire iron!');
                        opts.text = opts.text.replace(/callback/g, 'tire iron');
                    },
                    after_init: function(notice){
                        alert('I\'m called after the notice initializes. I\'m passed the PNotify object for the current notice: '+notice+'\n\nThere are more callbacks you can assign, but this is the last notice you\'ll see. Check the code to see them all.');
                    },
                    before_open: function(notice){
                        var source_note = 'Return false to cancel opening.';
                        dont_alert('I\'m called before the notice opens. I\'m passed the PNotify object for the current notice: '+notice);
                    },
                    after_open: function(notice){
                        dont_alert('I\'m called after the notice opens. I\'m passed the PNotify object for the current notice: '+notice);
                    },
                    before_close: function(notice, timer_hide){
                        var source_note = 'Return false to cancel close. Use PNotify.queueRemove() to set the removal timer again.';
                        dont_alert('I\'m called before the notice closes. I\'m passed the PNotify object for the current notice: '+notice);
                        dont_alert('I also have an argument called timer_hide, which is true if the notice was closed because the timer ran down. Value: '+timer_hide);
                    },
                    after_close: function(notice, timer_hide){
                        dont_alert('I\'m called after the notice closes. I\'m passed the PNotify object for the current notice: '+notice);
                        dont_alert('I also have an argument called timer_hide, which is true if the notice was closed because the timer ran down. Value: '+timer_hide);
                    }
                });">Notice with Callbacks</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Notice',
                    text: 'Right now I\'m a notice.',
                    before_close: function(notice){
                        notice.update({
                            title: 'Error',
                            text: 'Uh oh. Now I\'ve become an error.',
                            type: 'error',
                            before_close: function(notice){
                                notice.update({
                                    title: 'Success',
                                    text: 'I fixed the error!',
                                    type: 'success',
                                    before_close: function(notice){
                                        notice.update({
                                            title: 'Info',
                                            text: 'Everything\'s cool now.',
                                            type: 'info',
                                            before_close: null
                                        });
                                        notice.attention('swing');
                                        notice.queueRemove();
                                        return false;
                                    }
                                });
                                notice.attention('swing');
                                notice.queueRemove();
                                return false;
                            }
                        });
                        notice.attention('swing');
                        notice.queueRemove();
                        return false;
                    }
                });">Notice to Error to Success to Info</button>
                <button class="btn btn-default source" onclick="fake_load();">Progress Loader</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">History Module <small>Redisplay old notices.</small></h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" onclick="$(this).trigger('pnotify.history-last');">Display Last Notice</button>
                <button class="btn btn-default source" onclick="$(this).trigger('pnotify.history-all');">Display All Notices</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Pull Down Menu Notice',
                    text: 'I\'ll create a menu in the upper right corner that provides history functions.',
                    history: {
                        menu: true
                    }
                });">Pull Down Menu</button>
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'No History Notice',
                    text: 'I\'m not part of the notice history, so if you redisplay the last message, it won\'t be me.',
                    history: {
                        history: false
                    }
                });">No History Notice</button>
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Reference Module <small>A reference for when you are coding your own module.</small></h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" onclick="new PNotify({
                    title: 'Reference Module',
                    text: 'The reference module is a basic module that demonstrates how to write a PNotify module by implementing many of its features. You can find it in pnotify.reference.js.',
                    type: 'info',
                    reference: {
                        put_thing: true
                    }
                });">Reference Module Notice</button>
            </div>
        </div>
    </div>

    <div id="stacks" class="container page-section">
        <div class="page-header">
            <h1>Stacks <small>PNotify core comes with several default stacks.</small></h1>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Examples of Custom Stacks</h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" style="margin-left: 10px;" onclick="show_stack_info();">What are stacks?</button>
                <hr />
                <button class="btn btn-default source" onclick="show_stack_topleft('notice');">Notice</button>
                <button class="btn btn-default source" onclick="show_stack_topleft('info');">Info</button>
                <button class="btn btn-default source" onclick="show_stack_topleft('success');">Success</button>
                <button class="btn btn-default source" onclick="show_stack_topleft('error');">Error</button>
                Top Left. Moves down, then right. Pushes to stack top.
                <hr />
                <button class="btn btn-default source" onclick="show_stack_bottomleft('notice');">Notice</button>
                <button class="btn btn-default source" onclick="show_stack_bottomleft('info');">Info</button>
                <button class="btn btn-default source" onclick="show_stack_bottomleft('success');">Success</button>
                <button class="btn btn-default source" onclick="show_stack_bottomleft('error');">Error</button>
                Bottom Left. Moves right, then up. Pushes to stack top.
                <hr />
                <button class="btn btn-default source" onclick="show_stack_bottomright('notice');">Notice</button>
                <button class="btn btn-default source" onclick="show_stack_bottomright('info');">Info</button>
                <button class="btn btn-default source" onclick="show_stack_bottomright('success');">Success</button>
                <button class="btn btn-default source" onclick="show_stack_bottomright('error');">Error</button>
                Bottom Right. Moves up, then left. Pushes to stack bottom.
                <hr />
                <button class="btn btn-default source" onclick="show_stack_custom('notice');">Notice</button>
                <button class="btn btn-default source" onclick="show_stack_custom('info');">Info</button>
                <button class="btn btn-default source" onclick="show_stack_custom('success');">Success</button>
                <button class="btn btn-default source" onclick="show_stack_custom('error');">Error</button>
                Custom. Moves right, then down. Pushes to stack bottom.
                <hr />
                <button class="btn btn-default source" onclick="show_stack_custom2('notice');">Notice</button>
                <button class="btn btn-default source" onclick="show_stack_custom2('info');">Info</button>
                <button class="btn btn-default source" onclick="show_stack_custom2('success');">Success</button>
                <button class="btn btn-default source" onclick="show_stack_custom2('error');">Error</button>
                Custom. Moves left, then up. Pushes to stack top.
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Really Different Stacks</h3>
            </div>
            <div class="panel-body">
                <button class="btn btn-default source" onclick="show_stack_bar_top('notice');">Notice</button>
                <button class="btn btn-default source" onclick="show_stack_bar_top('info');">Info</button>
                <button class="btn btn-default source" onclick="show_stack_bar_top('success');">Success</button>
                <button class="btn btn-default source" onclick="show_stack_bar_top('error');">Error</button>
                Top bar style. (Like Old Microsoft Notification Bars.) Moves down, then right. Pushes to stack top.
                <hr />
                <button class="btn btn-default source" onclick="show_stack_bar_bottom('notice');">Notice</button>
                <button class="btn btn-default source" onclick="show_stack_bar_bottom('info');">Info</button>
                <button class="btn btn-default source" onclick="show_stack_bar_bottom('success');">Success</button>
                <button class="btn btn-default source" onclick="show_stack_bar_bottom('error');">Error</button>
                Bottom bar style. (Like New Microsoft Notification Bars.) Moves up, then right. Pushes to stack bottom.
                <hr />
                <button class="btn btn-default source" onmouseover="tooltip.open();" onmousemove="tooltip.get().css({'top': event.clientY+12, 'left': event.clientX+12});" onmouseout="tooltip.remove();">Hover Over Me</button>
                Tooltip
            </div>
            <div class="panel-heading">
                <h3 class="panel-title">Stack Contexts</h3>
            </div>
            <div class="panel-body">
                By default, a stack will place its notices underneath the body node. You can also specify a context for your notices to be placed in.
                <hr />
                <div class="row">
                    <div class="col-md-2">
                        <button class="btn btn-default source" onclick="show_stack_context('notice');">Notice</button>
                        <br />
                        <button class="btn btn-default source" onclick="show_stack_context('info');">Info</button>
                        <br />
                        <button class="btn btn-default source" onclick="show_stack_context('success');">Success</button>
                        <br />
                        <button class="btn btn-default source" onclick="show_stack_context('error');">Error</button>
                    </div>
                    <div class="col-md-10">
                        <div id="stack-context" class="well" style="height: 350px; position: relative; overflow: auto;">
                            <div class="page-header"><h3>Stack Context</h3></div>
                            <p>I'm the stack context where notices will be
                                placed. I'm position: relative, so the notices
                                will be positioned relative to me. My overflow
                                is set to auto, so the notices won't show beyond
                                my borders.</p>
                            <p style="text-align: center;"><img alt="Happy face" src="${path}/statics/assets/plugins/pnotify-master/includes/le_happy_face_by_luchocas.png" /></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel-footer alert-warning">
                <i class="glyphicon glyphicon-warning-sign"></i> Remember that you can't just pass an object literal as a
                stack. You need to create a new variable and pass that.
                This is because PNotify will use that object to store
                the notices that go into it.<br /><br />
                <div class="row">
                    <div class="col-sm-6">
                        <div class="panel panel-danger">
                            <div class="panel-heading"><h4 class="panel-title">Bad</h4></div>
                            <div class="panel-body">
                                <pre class="code">new PNotify({
    title: "Over Here",
    text: "Check me out. I'm in a different stack.",
    addclass: "stack-custom",
    stack: {"dir1":"down", "dir2":"right", "push":"top"}
})</pre>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="panel panel-success">
                            <div class="panel-heading"><h4 class="panel-title">Good</h4></div>
                            <div class="panel-body">
                                <pre class="code">var myStack = {"dir1":"down", "dir2":"right", "push":"top"};
new PNotify({
    title: "Over Here",
    text: "Check me out. I'm in a different stack.",
    addclass: "stack-custom",
    stack: myStack
})</pre>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="customization" class="container page-section">
        <div class="page-header">
            <h1>Customization and Tools</h1>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Timer</h3>
            </div>
            <div class="panel-body">
                Current Timer: <span id="timer" style="font-family: monospace;"></span>
                <script type="text/javascript">
                    function update_timer_display() {
                        $("#timer").text((PNotify.prototype.options.delay/1000)+" seconds");
                    }
                    $(function(){
                        update_timer_display();
                    });
                </script>
                <br style="margin-bottom: 3px;" />
                <button class="btn btn-default source" onclick="PNotify.prototype.options.delay ? (function(){PNotify.prototype.options.delay -= 500; update_timer_display();}()) : (alert('Timer is already at zero.'))">Lower Timer</button>
                <button class="btn btn-default source" onclick="(function(){PNotify.prototype.options.delay += 500; update_timer_display();}())">Raise Timer</button>
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Consuming the Alert Function</h3>
            </div>
            <div class="panel-body">
                This isn't really a feature of PNotify, but it's cool.
                <ol>
                    <li style="margin-bottom: 1em;"><button class="btn btn-default source" onclick="alert('I\'m a standard alert, called with alert().')">Display a JavaScript Alert</button></li>
                    <li style="margin-bottom: 1em;"><button class="btn btn-default source" onclick="consume_alert();">Consume alert()</button></li>
                    <li style="margin-bottom: 1em;">Repeat step 1.</li>
                    <li style="margin-bottom: 1em;"><button class="btn btn-default source" onclick="release_alert();">Release alert()</button></li>
                </ol>
            </div>
        </div>
    </div>

    <div id="comments" class="container page-section" style="margin-bottom: 20px;">
        <div class="page-header">
            <h1>Comments</h1>
        </div>
        <div id="disqus_thread"></div>
        <script type="text/javascript">
            /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
            var disqus_shortname = 'pnotify'; // required: replace example with your forum shortname

            /* * * DON'T EDIT BELOW THIS LINE * * */
            (function() {
                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                dsq.src = 'https://' + disqus_shortname + '.disqus.com/embed.js';
                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
            })();
        </script>
        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
        <a href="https://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>
    </div>
    <p id="copyright">&copy; 2011-2015 Hunter Perrin. All Rights Reserved.</p>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4fa2edbb6da70bd1" async="async"></script>

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-49382439-1', 'sciactive.com');
        ga('send', 'pageview');
    </script>
</div>