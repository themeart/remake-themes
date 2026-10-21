{extends file="../../Remake/account/my_account.tpl"}

{block name='account-my-account-orders-body'}
                                <div class="table-responsive">
                                    <table class="table table-vertical-middle table-hover">
                                        <tbody>
                                        {foreach $Bestellungen as $order}
                                            {if $order@index === 5}{break}{/if}
                                            <tr title="{lang key='showOrder' section='login'}: {lang key='orderNo' section='login'} {$order->cBestellNr}"
                                                class="clickable-row cursor-pointer"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                data-boundary="window"
                                                data-href="{$cCanonicalURL}?bestellung={$order->kBestellung}">
                                                <td>{$order->dBestelldatum}</td>
                                                <td class="text-right-util"></td>
                                                <td class="text-right-util">
                                                   {$order->Status}
                                                </td>
                                                <td class="text-right-util d-none d-md-table-cell">
                                                    <i class="fa fa-eye"></i>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
{/block}




{block name='account-my-account-orders-body'}
                                <div class="table-responsive">
                                    <table class="table table-vertical-middle table-hover">
                                        <tbody>
                                        {foreach $Bestellungen as $order}
                                            {if $order@index === 5}{break}{/if}
                                            <tr title="{lang key='showOrder' section='login'}: {lang key='orderNo' section='login'} {$order->cBestellNr}"
                                                class="clickable-row cursor-pointer"
                                                data-toggle="tooltip"
                                                data-placement="top"
                                                data-boundary="window"
                                                data-href="{$cCanonicalURL}?bestellung={$order->kBestellung}">
                                                <td>{$order->dBestelldatum}</td>
                                                <td class="text-right-util"></td>
                                                <td class="text-right-util">
                                                   {$order->Status}
                                                </td>
                                                <td class="text-right-util d-none d-md-table-cell">
                                                    <i class="fa fa-eye"></i>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
{/block}
