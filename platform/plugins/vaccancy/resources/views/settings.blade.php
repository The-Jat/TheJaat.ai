<x-core-setting::section
    :title="trans('plugins/vaccancy::base.settings.title')"
    :description="trans('plugins/vaccancy::base.settings.description')"
>
    <x-core-setting::checkbox
        name="vaccancy_post_schema_enabled"
        :label="trans('plugins/vaccancy::base.settings.enable_vaccancy_post_schema')"
        :value="setting('vaccancy_post_schema_enabled', true)"
        :helper-text="trans('plugins/vaccancy::base.settings.enable_vaccancy_post_schema_description')"
    />

    <x-core-setting::select
        name="vaccancy_post_schema_type"
        :label="trans('plugins/vaccancy::base.settings.schema_type')"
        :options="[
            'NewsArticle' => 'NewsArticle',
            'News' => 'News',
            'Article' => 'Article',
            'VaccancyPosting' => 'VaccancyPosting'
        ]"
        :value="setting('vaccancy_post_schema_type', 'NewsArticle')"
    />
</x-core-setting::section>
