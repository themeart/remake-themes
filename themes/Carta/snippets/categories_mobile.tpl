{block name='snippets-categories-mobile'}
    {strip}

        {if !isset($i)}
            {assign var=i value=0}
        {/if}
        {if !isset($activeId)}
            {if $NaviFilter->hasCategory()}
                {$activeId = $NaviFilter->getCategory()->getValue()}
            {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($Artikel)}
                {$activeId = $Artikel->gibKategorie()}
            {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($smarty.session.LetzteKategorie)}
                {$activeId = $smarty.session.LetzteKategorie}
            {else}
                {$activeId = 0}
            {/if}
        {/if}

    {if $Einstellungen.template.megamenu.show_categories !== 'N'
        && ($Einstellungen.global.global_sichtbarkeit != 3 || \JTL\Session\Frontend::getCustomer()->getID() > 0)}
        {get_category_array categoryId=0 assign='categories'}
        {if !empty($categories)}
            {if !isset($activeParents)
                && ($nSeitenTyp === $smarty.const.PAGE_ARTIKEL || $nSeitenTyp === $smarty.const.PAGE_ARTIKELLISTE)}
                {get_category_parents categoryId=$activeId assign='activeParents'}
            {/if}
            
            {assign var=activeParentIds value=[]}
            {if isset($activeParents)}
                {foreach $activeParents as $activeParent}
                    {$activeParentIds[] = $activeParent->getID()}
                {/foreach}
            {/if}
            {foreach $categories as $category}
                {if isset($activeParents) && is_array($activeParents) && isset($activeParents[$i])}
                    {assign var=activeParent value=$activeParents[$i]}
                {/if}
                {if $category->isOrphaned() === false}
                        
                            <li class="nav-scrollbar-item py-2 {if $Einstellungen.template.megamenu.show_categories === 'mobile'} d-lg-none
                                    {elseif $Einstellungen.template.megamenu.show_categories === 'desktop'} d-none d-lg-inline-block {/if}
                                    {if $category->getShortName()} flag-{$category->getShortName()|seofy|lower} {/if}
                                    {if $category->getID() === $activeId}active{/if} 
                                    order-5">
                                {link href=$category->getURL()
                                    title=$category->getName()|escape:'html'
                                    class="btn btn-{if $category->getID() !== $activeId}outline-{/if}primary mr-3"
                                    target="_self"
                                    data=["category-id"=>$category->getID()]}
                                    <span class="text-truncate">{$category->getShortName()}</span>
                                {/link}
                            </li>
                       
                {/if}
            {/foreach}

        {/if}
    {/if}

    {/strip}
{/block}