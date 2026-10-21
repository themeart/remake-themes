{extends file="../../Remake/layout/header_logo.tpl"}

{block name='layout-header-logo-navbar-toggle'}
    {if isset($Einstellungen.template.header.mobile_menu_type) && $Einstellungen.template.header.mobile_menu_type === 'left'}
        {include file='layout/header_shop_nav_position.tpl'}
    {/if}
{/block}   