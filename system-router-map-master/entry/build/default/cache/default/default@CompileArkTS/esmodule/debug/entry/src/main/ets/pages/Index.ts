if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface NavigationExample_Params {
    pageInfos?: NavPathStack;
}
class NavigationExample extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.pageInfos = new NavPathStack();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: NavigationExample_Params) {
        if (params.pageInfos !== undefined) {
            this.pageInfos = params.pageInfos;
        }
    }
    updateStateVars(params: NavigationExample_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private pageInfos: NavPathStack;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Navigation.create(this.pageInfos, { moduleName: "entry", pagePath: "entry/src/main/ets/pages/Index", isUserCreateStack: true });
            Navigation.title({ "id": 16777224, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
        }, Navigation);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 12 });
            Column.width({ "id": 16777237, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Column.height({ "id": 16777236, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Column.justifyContent(FlexAlign.End);
            Column.padding({
                bottom: { "id": 16777222, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" },
                left: { "id": 16777222, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" },
                right: { "id": 16777222, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }
            });
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 16777225, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
            Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.onClick(() => {
                //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                this.pageInfos.pushPathByName('pageOne', null);
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 16777226, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
            Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.onClick(() => {
                //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                this.pageInfos.pushPathByName('pageTwo', null);
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 16777227, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
            Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.onClick(() => {
                //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                this.pageInfos.pushPathByName('HarAPageOne', null);
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 16777228, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
            Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.onClick(() => {
                //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                this.pageInfos.pushPathByName('HarAPageTwo', null);
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 16777231, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
            Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.onClick(() => {
                //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                this.pageInfos.pushPathByName('HspAPageOne', null);
            });
        }, Button);
        Button.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel({ "id": 16777232, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
            Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
            Button.onClick(() => {
                //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                this.pageInfos.pushPathByName('HspAPageTwo', null);
            });
        }, Button);
        Button.pop();
        Column.pop();
        Navigation.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "NavigationExample";
    }
}
registerNamedRoute(() => new NavigationExample(undefined, {}), "", { bundleName: "com.samples.systemrouter", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false", moduleType: "followWithHap" });
