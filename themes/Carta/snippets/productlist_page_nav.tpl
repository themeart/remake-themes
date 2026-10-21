{block name='snippets-productlist-page-nav'}
    {if $Suchergebnisse->getProductCount() > 0}
        {$filterPlacement = $Einstellungen.template.productlist.filter_placement}
        {opcMountPoint id='opc_before_page_nav_'|cat:$navid}
        {if $hrTop|default:false === true}
            {block name='snippets-productlist-page-nav-hr-top'}
                <hr class="productlist-page-nav-top">
            {/block}
        {/if}
        {row no-gutters=true class="{if $navid === 'header'}productlist-page-nav-header-m{/if} productlist-page-nav"}
            {block name='snippets-productlist-page-nav-current-page-count'}
                {col class="justify-content-center productlist-item-info {if $Suchergebnisse->getPages()->getMaxPage() > 1}productlist-item-border py-2 py-lg-0{/if}"}
                    {lang key="products"} {$Suchergebnisse->getOffsetStart()} - {$Suchergebnisse->getOffsetEnd()} {lang key='of' section='productOverview'} {$Suchergebnisse->getProductCount()}
                {/col}
            {/block}
            {if $Suchergebnisse->getPages()->getMaxPage() > 1 && !($isMobile && $navid === 'header')}
                {block name='snippets-productlist-page-nav-page-nav'}
                    {col cols=12 md="auto" class="productlist-pagination d-md-inline-flex"}
                        <nav class="navbar-pagination" aria-label="{lang section='aria' key='productlistNavigation'}">
                            <ul class="pagination">
                                {block name='snippets-productlist-page-nav-first-page'}
                                    <li class="page-item{if $Suchergebnisse->getPages()->getCurrentPage() == 1} disabled{/if}">
                                        {link class="btn btn-outline-secondary page-link- js-pagination-ajax" href=$filterPagination->getPrev()->getURL()|default:"#" aria=['label' => {lang key='previous' section='productOverview'}, 'diabled' => "{if $Suchergebnisse->getPages()->getCurrentPage() == 1}true{else}false{/if}"]}<i class="fas fa-angle-left"></i>{/link}
                                    </li>
                                {/block}
                                <li class="page-item dropdown">
                                    {block name='snippets-productlist-page-nav-button'}
                                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="pagination-site">{lang key='page'}</span> {$Suchergebnisse->getPages()->getCurrentPage()}
                                        </button>
                                    {/block}
                                    <div class="dropdown-menu shadow-none">
                                        {block name='snippets-productlist-page-nav-pages'}
                                            {foreach $filterPagination->getPages() as $page}
                                                <div class="dropdown-item page-item{if $page->isActive()} active{/if}">
                                                    {link class="{if !$isMobile}btn btn-outline-secondary{else}page-link{/if} js-pagination-ajax" href=$page->getURL()}<span class="pagination-site">{lang key='page'}</span> {$page->getPageNumber()}{/link}
                                                </div>
                                            {/foreach}
                                        {/block}
                                    </div>
                                </li>
                                {block name='snippets-productlist-page-nav-last-page'}
                                    <li class="page-item{if $Suchergebnisse->getPages()->getCurrentPage() == $Suchergebnisse->getPages()->getMaxPage()} disabled{/if}">
                                        {link class="btn btn-outline-secondary page-link- js-pagination-ajax" href=$filterPagination->getNext()->getURL()|default:"#" aria=['label' => {lang key='next' section='productOverview'}, 'diabled' => "{if $Suchergebnisse->getPages()->getCurrentPage() == $Suchergebnisse->getPages()->getMaxPage()}true{else}false{/if}"]}<i class="fas fa-angle-right"></i>{/link}
                                    </li>
                                {/block}
                            </ul>
                        </nav>
                    {/col}
                {/block}
            {/if}
        {/row}
        {if $hrBottom|default:true}
            {block name='snippets-productlist-page-nav-hr-top'}
                <hr class="productlist-page-nav-bottom">
            {/block}
        {/if}
    {/if}
{/block}
