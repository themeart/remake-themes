{block name='layout-header-menu-single-row'}
    {block name='layout-header-variables'}
        {$menuScroll=$Einstellungen.template.header.menu_scroll === 'menu' && $Einstellungen.template.header.menu_single_row === 'Y'}
        {$headerWidth=$Einstellungen.template.header.header_full_width}
    {/block}
    {block name='layout-header-menu-single-row-main'}
        {*block name='layout-header-menu-single-row-top-bar-outer'}
            {if $menuScroll && $Einstellungen.template.header.menu_show_topbar === 'Y'}
                <div id="header-top-bar" class="d-none topbar-wrapper full-width-mega {if $Einstellungen.template.header.header_full_width === 'Y'}is-fullwidth{/if} {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}d-lg-flex{/if}">
                    <div class="{if $headerWidth === 'B'}container{else}container-fluid {if $headerWidth === 'N'}container-fluid-xl{/if}{/if} {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}d-lg-flex flex-row-reverse{/if}">
                        {block name='layout-header-menu-single-row-top-bar-outer-include-header-top-bar'}
                            {include file='layout/header_top_bar.tpl'}
                        {/block}
                    </div>
                </div>
            {/if}
        {/block*}
        {block name='layout-header-menu-single-row-nav'}
            {block name='layout-header-menu-single-row-nav-main'}
                <div class="hide-navbar{if $menuScroll && $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG} menu-scroll{/if} {if $headerWidth === 'B'}container{else}container-fluid {if $headerWidth === 'N'}container-fluid-xl{/if}{/if}
                    {if $Einstellungen.template.header.menu_logo_centered === 'Y'} menu_logo_centered {/if}
                    {if $isMobile} is-mobile {/if}
                    menu-search-position-{$Einstellungen.template.header.menu_search_position}">
                    {navbar toggleable=true fill=true type="expand-lg" class="row justify-content-center align-items-center-util"}
                        {block name='layout-header-menu-single-row-logo'}
                            {col class="nav-logo-wrapper"}
                                {block name='layout-header-menu-single-row-logo-include-header-logo'}
                                    {include file='layout/header_logo.tpl'}
                                {/block}
                            {/col}
                        {/block}
                        {block name='layout-header-menu-single-row-nav-main-inner'}
                            {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}
                                {block name='layout-header-menu-single-row-secure-checkout'}
                                    {block name='layout-header-menu-single-row-secure-checkout-title'}
                                        {col class="secure-checkout-icon text-center"}
                                            <i class="fas fa-lock icon-mr-2"></i>{lang key='secureCheckout' section='checkout'}
                                        {/col}
                                    {/block}
                                {/block}
                            {else}
                                {block name='layout-header-menu-single-row-include-header-nav-search'}
                                    {if !$isMobile && $Einstellungen.template.header.menu_search_position === 'left'}
                                        {col class="main-search-wrapper nav-right"}
                                            {include file='layout/header_nav_search.tpl'}
                                        {/col}
                                    {/if}
                                {/block}
                                {block name='layout-header-menu-single-row-icons'}
                                    {col class="nav-icons-wrapper order-lg-4"}
                                        {include file='layout/header_nav_icons.tpl'}
                                    {/col}
                                {/block}
                            {/if}
                        {/block}
                    {/navbar}
                </div>
            {/block}
            {block name='layout-header-menu-single-row-nav-categories'}
                {if $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
                    <div class="navbar-wrapper">
                        <div class="{if $headerWidth === 'B'}container{else}container-fluid {if $headerWidth === 'N'}container-fluid-xl{/if}{/if}
                            menu-center-{$Einstellungen.template.header.menu_center}
                            menu-multiple-rows-{$Einstellungen.template.header.menu_multiple_rows}">
                            {navbar toggleable=true fill=true type="expand-lg" class="justify-content-start {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}align-items-center-util{else}align-items-lg-end-{/if}"}
                                {block name='layout-header-menu-single-row-include-categories-mega'}
                                    {include file='layout/header_categories.tpl'
                                        menuMultipleRows=($Einstellungen.template.header.menu_multiple_rows === 'multiple')
                                        menuScroll=$menuScroll}
                                {/block}
                            {/navbar}
                        </div>
                    </div>
                {/if}
            {/block}
        {/block}
    {/block}
{/block}
