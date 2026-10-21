{extends file="../../Remake/account/order_item.tpl"}

{block name='account-order-item-base-price'}{/block}

{block name='account-order-item-config-items'}
    <ul class="config-items text-muted-util small">
        {foreach $Bestellung->Positionen as $KonfigPos}
            {if $oPosition->cUnique == $KonfigPos->cUnique && $KonfigPos->kKonfigitem > 0}
                <li>
                    <span class="qty">{if !(is_string($oPosition->cUnique) && !empty($oPosition->cUnique) && (int)$oPosition->kKonfigitem === 0)}{$KonfigPos->nAnzahlEinzel}{else}1{/if}x</span>
                    {$KonfigPos->cName|trans} &raquo;<br/>
                </li>
            {/if}
        {/foreach}
    </ul>
{/block}

{block name='account-order-item-price-single-price'}
    {col class='price-col hidden-xs text-nowrap-util' md=2 cols=3}{/col}
{/block}

{block name='account-order-item-price-overall'}
    {col class='price-col text-nowrap-util' md=2 cols=3}{/col}
{/block}

{block name='account-order-items-total-price-net'}{/block}

{block name='account-order-items-total-tax'}{/block}

{block name='account-order-items-total-total'}{/block}