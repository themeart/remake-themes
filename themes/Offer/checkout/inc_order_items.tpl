{extends file="../../Remake/checkout/inc_order_items.tpl"}

{block name='checkout-inc-order-items-order-items-header'}
    {row class="checkout-items-header text-accent d-none d-lg-flex"}
        {if $Einstellungen.kaufabwicklung.warenkorb_produktbilder_anzeigen === 'Y'}
            {col cols=3}{/col}
        {/if}
        {col cols=$itemInfoCols}{lang key='product'}{/col}
        {col cols=2 class="text-center-util"}{lang key="quantity" section="checkout"}{/col}
    {/row}
    <hr class="checkout-items-header-hr d-none d-lg-flex">
{/block}

{block name='checkout-inc-order-items-product-data-base-price'}{/block}
{block name='checkout-inc-order-items-product-data-delivery-status'}{/block}

{block name='product-config-item'}
    {if $oPosition->cUnique == $KonfigPos->cUnique && $KonfigPos->kKonfigitem > 0
        && !$KonfigPos->isIgnoreMultiplier()}
        <li>
            <span class="qty">{if !$KonfigPos->istKonfigVater()}{$KonfigPos->nAnzahlEinzel}{else}1{/if}x</span>
            {$KonfigPos->cName|trans} &raquo;
        </li>
    {elseif $oPosition->cUnique == $KonfigPos->cUnique && $KonfigPos->kKonfigitem > 0
        && $KonfigPos->isIgnoreMultiplier()}
        {if !$labeled}
            <strong>{lang key='one-off' section='checkout'}</strong>
            {$labeled=true}
        {/if}
        <li>
            <span class="qty">{if !$KonfigPos->istKonfigVater()}{$KonfigPos->nAnzahlEinzel}{else}1{/if}x</span>
            {$KonfigPos->cName|trans} &raquo;
        </li>
    {/if}
{/block}

{block name='checkout-inc-order-items-product-data-note'}{/block}

{block name='checkout-inc-order-items-price-single'}{/block}
{block name='checkout-inc-order-items-order-items-price-net'}{/block}
{block name='checkout-inc-order-items-price-net'}{/block}
{block name='checkout-inc-order-items-is-not-product'}{/block}

{if $Einstellungen.global.global_steuerpos_anzeigen !== 'N' && $Steuerpositionen|count > 0}
    {block name='checkout-inc-order-items-tax'}{/block}
{/if}
{block name='checkout-inc-order-items-price-sticky'}{/block}
{block name='checkout-inc-order-items-shipping'}{/block}