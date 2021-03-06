<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <!--<![endif]-->
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
        <meta name="keywords" content= "<?php echo $keywords; ?>" />
        <?php } ?>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="catalog/view/javascript/materialize/js/materialize.min.js"></script>

        <link type="text/css" rel="stylesheet" href="catalog/view/javascript/materialize/css/materialize.min.css"  media="screen,projection"/>

        <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
        <link href="catalog/view/theme/esen/stylesheet/stylesheet.css" rel="stylesheet">
        <!--<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">-->
        <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
        <script src="catalog/view/javascript/material.js" type="text/javascript"></script>
        <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
        <?php } ?>
        <?php echo $google_analytics; ?>
    </head>
    <body>
        <header>
                <nav class="amber darken-4">
                    <a href="#" data-activates="slide-out" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
                            <ul class="right hide-on-med-and-down">
                            <li>
                                <a href="<?php echo $contact; ?>">
                                    <i class="mdi-communication-phone small left"></i><span class=""><?php echo $telephone; ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class='dropdown-button' data-activates='account-dropdown'>
                                    <i class="mdi-social-person small left"></i><span><?php echo $text_account; ?></span>
                                </a>                            
                            </li>
                            <li>
                                <a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>">
                                    <i class="mdi-action-favorite small left"></i><span><?php echo $text_wishlist; ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
                                    <i class="mdi-action-shopping-cart small left"></i> <span><?php echo $text_shopping_cart; ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>">
                                    <i class="mdi-action-exit-to-app small left"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span>
                                </a>
                            </li>
                        </ul>
                        <ul id='account-dropdown' class='dropdown-content'>
                            <?php if ($logged) { ?>
                            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                            <?php } else { ?>
                            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                            <?php } ?>
                        </ul>
                </nav>
            <div class='row'>

            </div>
            <?php if ($categories) { ?>
            <ul id="slide-out" class="side-nav fixed">
                <li class="logo waves-effect waves-orange">
                    <a href="<?php echo $home; ?>" class="brand-logo">
                        <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
                    </a>
                </li>
                <?php foreach ($categories as $category) { ?>
                <?php if ($category['children'] && !empty($category['children'])) { ?>
                <li>
                    <ul class="collapsible expandable">
                        <li>
                            <a class="collapsible-header waves-effect waves-orange"><?php echo $category['name']; ?><i class="mdi-navigation-arrow-drop-down right"></i></a>
                            <div class="collapsible-body">
                                <ul>
                                    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                        <?php foreach ($children as $child) { ?>
                                        <li class="waves-effect waves-orange"><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                                        <?php } ?>
                                    <?php } ?>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </li>
                <?php } else { ?>
                <li class="waves-effect waves-orange"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
                <?php } ?>
            </ul>
            <?php } ?>
        </header>
        <div class="row"></div>
        <main>
