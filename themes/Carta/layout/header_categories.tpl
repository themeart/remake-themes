{block name='layout-header-categories'}
    {if !$isMobile}
    <div id="mainNavigation" class="collapse navbar-collapse {if isset($Einstellungen.template.header.mobile_menu_type)}menu-type-{$Einstellungen.template.header.mobile_menu_type} {/if}{if $menuMultipleRows|default:false}nav-multiple-row{elseif $Einstellungen.template.megamenu.menu_type !== 'button-pulldown'}nav-scrollbar{/if}" tabindex="-1">
        {block name='layout-header-categories-include-include-categories-body'}
            {if !$isMobile && $Einstellungen.template.megamenu.menu_type === 'button-pulldown'}
                <div class="nav-mobile-body">
                    {navbarnav class="nav-scrollbar-inner mr-auto"}
                        {include file='snippets/categories_pulldown.tpl' tag='li'}
                        {if $Einstellungen.template.megamenu.show_pages !== 'N'}
                            {include file='snippets/linkgroup_list.tpl' linkgroupIdentifier='megamenu' dropdownSupport=true tplscope='megamenu'}
                        {/if} 
                    {/navbarnav}
                </div>
            {else}
                <div class="nav-mobile-body">
                    {navbarnav class="nav-scrollbar-inner mr-auto"}
                    {block name='layout-header-categories-include-include-categories-mega'}
                        {include file='snippets/categories_mega.tpl'}
                    {/block}
                    {/navbarnav}
                </div>
            {/if}
        {/block}
    </div>
    {/if}
{/block}