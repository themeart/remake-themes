{extends file="../../Remake/layout/header_nav_icons.tpl"}

{block name='layout-header-nav-icons-include-header-nav-search' prepend}
    {if $Einstellungen.template.megamenu.show_pages !== 'N' && (!$isMobile || $isTablet)}
        {nav id="mega-nav" tag="div" class="nav-mega"}
            <ul class="navbar-nav nav-scrollbar-inner d-none d-md-flex">
            {include file='snippets/linkgroup_list.tpl' linkgroupIdentifier='megamenu' dropdownSupport=true tplscope='megamenu'}
            </ul>
        {/nav}
    {/if}
{/block}