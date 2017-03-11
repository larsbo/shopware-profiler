<style>{fetchSvg file="@Toolbar/_resources/css/toolbar.css"}</style>
<div class="sf-toolbarreset clear-fix">
    {foreach from=$sProfilerCollectors item=sProfilerCollector}
        {if !empty($sProfilerCollector->getToolbarTemplate())}
            {include file=$sProfilerCollector->getToolbarTemplate()}
        {/if}
    {/foreach}
    <a class="hide-button" title="Close Toolbar" onclick="document.querySelector('.sf-toolbarreset').remove();">
        {fetchSvg file="@Toolbar/_resources/svg/close.svg"}
    </a>
</div>
<script type="application/javascript">
    var ajaxBeforeSend = window.CSRF._ajaxBeforeSend;

    window.CSRF._ajaxBeforeSend = function (event, request) {
        ajaxBeforeSend.apply(window.CSRF, [event, request]);
        request.setRequestHeader('X-Profiler', '{$sProfilerID}');
    };
</script>