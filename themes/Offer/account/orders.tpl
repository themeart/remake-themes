{extends file="../../Remake/account/orders.tpl"}

            {block name='account-orders-orders'}
                {get_static_route id='jtl.php' assign='ordersURL'}
                {foreach $orderPagination->getPageItems() as $order}
                    {card no-body=true class='account-orders-item'}
                        {cardheader}
                            {link href="{$ordersURL}?bestellung={$order->kBestellung}"
                                title="{lang key='showOrder' section='login'}: {lang key='orderNo' section='login'} {$order->cBestellNr}"
                                data=["toggle" => "tooltip", "placement" => "bottom"]
                            }
                                {row}
                                    {col cols=6 md=3 order=1}
                                        <strong><i class="far fa-calendar-alt"></i> {$order->dBestelldatum}</strong>
                                    {/col}
                                    {col cols=6 md=2 order=4 order-md=2}{/col}
                                    {col cols=4 md=2 order=2 order-md=3}
                                        {$order->cBestellNr}
                                    {/col}
                                    {col cols=6 md=4 order=5 order-md=4}
                                        {lang key='orderStatus' section='login'}: {$order->Status}
                                    {/col}
                                    {col cols=2 md=1 order=3 order-md=5 class="text-right-util"}
                                        <i class="fa fa-eye"></i>
                                    {/col}
                                {/row}
                            {/link}
                        {/cardheader}
                    {/card}
                {/foreach}
            {/block}
            
