{extends file="../../Remake/layout/header.tpl"}

{block name='layout-header-header' append}
{if $isMobile && ($nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG && $nSeitenTyp !== $smarty.const.PAGE_REGISTRIERUNG)}
    <div class="container-fluid container-fluid-xl fixed-mobile-carta d-lg-none">
        {nav tag="nav" class="navbar nav-mobile-carta nav-scrollbar"}
            {navbarnav class="m-auto nav-scrollbar-inner"}
                {include file='snippets/categories_mobile.tpl'}
            {/navbarnav}
        {/nav}
    </div>
{/if}
{/block}

