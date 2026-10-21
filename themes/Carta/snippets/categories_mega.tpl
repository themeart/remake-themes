{extends file="../../Remake/snippets/categories_mega.tpl"}

                        {block name='snippets-categories-mega-category-child'}
                            <li class="nav-item nav-scrollbar-item dropdown dropdown-full
                                {if $Einstellungen.template.megamenu.show_categories === 'mobile'} d-lg-none
                                {elseif $Einstellungen.template.megamenu.show_categories === 'desktop'} d-none d-lg-inline-block {/if}
                                {if $category->getShortName()} flag-{$category->getShortName()|seofy|lower} {/if}
                                {if in_array($category->getID(),$activeParentIds) || $category->getID() === $activeId
                            || (isset($activeParent)
                                && $activeParent->getID() === $category->getID())} active{/if} order-5">
                                {link href=$category->getURL()
                                    title=$category->getName()|escape:'html'
                                    class="btn btn-{if !in_array($category->getID(),$activeParentIds)}outline-{/if}primary"
                                    target="_self"
                                    data=["category-id"=>$category->getID()]}
                                    {if !empty($category->categoryFunctionAttributes['icon'])}<i class="{$category->categoryFunctionAttributes['icon']} pr-2"></i>{/if}
                                    <span class="nav-mobile-heading">{$category->getShortName()}</span>
                                {/link}
                                <div class="dropdown-menu">
                                    <div class="dropdown-body">
                                        {container class="subcategory-wrapper"}
                                            {$categoryMainImage = false}
                                            {if !empty($category->categoryFunctionAttributes['megamenu_category_image'])}
                                                {$categoryMainImage = !$isMobile && isset($Einstellungen.template.megamenu.show_category_image) && $Einstellungen.template.megamenu.show_category_image == 'Y'}
                                            {else}
                                                {$categoryMainImage = !$isMobile && (!empty($category->getImage(\JTL\Media\Image::SIZE_XS)) && $category->getImage(\JTL\Media\Image::SIZE_XS) !== $imageBaseURL|cat:$smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN) && isset($Einstellungen.template.megamenu.show_category_image) && $Einstellungen.template.megamenu.show_category_image == 'Y'}
                                            {/if}
                                            {if $isMobile || $Einstellungen.template.megamenu.subcategories_type === 'rows'}
                                                {capture name="categoryCapture" assign="mainCategoryCapture"}
                                                    {row class="lg-row-lg nav"}
                                                        {col lg=3 class="nav-item-lg-m nav-item dropdown- d-lg-none"}
                                                            {link href=$category->getURL()}
                                                                <strong class="nav-mobile-heading nav-link">{lang key='menuShow' printf=$category->getShortName()}</strong>
                                                            {/link}
                                                        {/col}
                                                        {block name='snippets-categories-mega-sub-categories'}
                                                            {if $category->hasChildren()}
                                                                {if !empty($category->getChildren())}
                                                                    {assign var=sub_categories value=$category->getChildren()}
                                                                {else}
                                                                    {get_category_array categoryId=$category->getID() assign='sub_categories'}
                                                                {/if}
                                                                {foreach name='subCategoriesIndex' from=$sub_categories item=$sub}
                                                                    {col lg=3 xl="{if empty($categoryMainImage)}2{else}3{/if}" class="nav-item-lg-m nav-item {if $sub->hasChildren() && ($isMobile || $Einstellungen.template.megamenu.show_subcategories !== 'N')}dropdown{/if}"}
                                                                        {block name='snippets-categories-mega-category-child-body-include-categories-mega-recursive'}
                                                                            {include file='snippets/categories_mega_recursive.tpl' activeParentIds=$activeParentIds mainCategory=$sub firstChild=true parentCategory=$category subCategory=$i + 1}
                                                                        {/block}
                                                                    {/col}
                                                                {/foreach}
                                                            {/if}
                                                        {/block}
                                                    {/row}
                                                {/capture}

                                                {if $categoryMainImage==false}
                                                    {$mainCategoryCapture}
                                                {else}
                                                    {row}
                                                        {col lg=8 xl=9}
                                                            {$mainCategoryCapture}
                                                        {/col}
                                                        {col lg=4 xl=3 class="py-3 pr-5"}
                                                            {$imgMenuAlt = $category->getAttribute('img_alt')}
                                                            {if !empty($category->categoryFunctionAttributes['megamenu_category_image'])}
                                                                {image lazy=true webp=true
                                                                    src=$category->categoryFunctionAttributes['megamenu_category_image']
                                                                    alt=$category->getName()|escape:'html'}
                                                            {else}
                                                                {include file='snippets/image.tpl'
                                                                    class='menu-image'
                                                                    item=$category
                                                                    square=false
                                                                    srcSize='md'
                                                                    alt="{if empty($imgMenuAlt->cWert)}{$category->getName()|escape:'html'}{else}{$imgMenuAlt->cWert}{/if}"}
                                                            {/if}
                                                        {/col}
                                                    {/row}
                                                {/if}
                                            {elseif !$isMobile && $Einstellungen.template.megamenu.subcategories_type === 'row-desc'}
                                                {block name='snippets-categories-mega-sub-categories-row-desc'}
                                                    {if $category->hasChildren()}
                                                        {if !empty($category->getChildren())}
                                                            {assign var=sub_categories value=$category->getChildren()}
                                                        {else}
                                                            {get_category_array categoryId=$category->getID() assign='sub_categories'}
                                                        {/if}
                                                        {col lg=3 xl=3 class="megamenu-nav"}
                                                            <ul class="list-unstyled">
                                                                {foreach name='subCategoriesIndex' from=$sub_categories item=$sub}
                                                                    {block name='snippets-categories-mega-category-child-body-include-categories-mega-recursive'}
                                                                        {include file='snippets/categories_mega_recursive.tpl' activeParentIds=$activeParentIds mainCategory=$sub parentCategory=$category firstChild=true subCategory=$i + 1}
                                                                    {/block}
                                                                {/foreach}
                                                            </ul>
                                                        {/col}
                                                        {col lg=9 xl=9 class="megamenu-desc"}
                                                            {block name='snippets-categories-mega-sub-megamenu-desc-inner'}
                                                                {assign var="megamenuCatDesc" value=$category->getDescription()}
                                                                {assign var="megamenuCatDescSplit" value="##break##"|explode:$megamenuCatDesc}
                                                                {if isset($megamenuCatDescSplit[1])}
                                                                    {assign var="megamenuCatDesc" value=$megamenuCatDescSplit[0]}
                                                                {else}
                                                                    {assign var="megamenuCatDesc" value=$megamenuCatDesc|strip_tags|truncate:300}
                                                                {/if}
                                                                <div class="megamenu-desc-inner">
                                                                    <div class="font-weight-semibold mb-2">{$category->getName()}</div>
                                                                    {$megamenuCatDesc}
                                                                </div>
                                                            {/block}
                                                        {/col}
                                                    {/if}
                                                {/block}
                                            {else}
                                                {block name='snippets-categories-mega-sub-categories-list'}
                                                    {if $category->hasChildren()}
                                                        {if !empty($category->getChildren())}
                                                            {assign var=sub_categories value=$category->getChildren()}
                                                        {else}
                                                            {get_category_array categoryId=$category->getID() assign='sub_categories'}
                                                        {/if}
                                                        <ul class="columns list-unstyled">
                                                            {foreach name='subCategoriesIndex' from=$sub_categories item=$sub}
                                                                <li class="nav-item">
                                                                {block name='snippets-categories-mega-category-child-body-include-categories-mega-recursive'}
                                                                    {include file='snippets/categories_mega_recursive.tpl' activeParentIds=$activeParentIds mainCategory=$sub parentCategory=$category firstChild=true subCategory=$i + 1}
                                                                {/block}
                                                                </li>
                                                            {/foreach}
                                                        </ul>
                                                    {/if}
                                                {/block}
                                            {/if}
                                        {/container}
                                    </div>
                                </div>
                            </li>
                        {/block}

                        {block name='snippets-categories-mega-category-no-child'}
                            <li class="nav-scrollbar-item {if $Einstellungen.template.megamenu.show_categories === 'mobile'} d-lg-none
                                    {elseif $Einstellungen.template.megamenu.show_categories === 'desktop'} d-none d-lg-inline-block {/if}
                                    {if $category->getShortName()} flag-{$category->getShortName()|seofy|lower} {/if}
                                    {if $category->getID() === $activeId}active{/if} 
                                    order-5">
                                {link href=$category->getURL()
                                    title=$category->getName()|escape:'html'
                                    class="btn btn-{if $category->getID() !== $activeId}outline-{/if}primary mx-2"
                                    target="_self"
                                    data=["category-id"=>$category->getID()]}
                                    <span class="text-truncate">{$category->getShortName()}</span>
                                {/link}
                            </li>
                        {/block}

{block name='snippets-categories-mega-manufacturers'} {/block}

{block name='snippets-categories-mega-include-linkgroup-list'}{/block}
