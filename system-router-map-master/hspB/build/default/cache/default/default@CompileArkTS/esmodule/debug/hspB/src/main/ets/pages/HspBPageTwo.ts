if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface HspBPageTwo_Params {
    pageInfos?: NavPathStack;
}
import Logger from "@bundle:com.samples.systemrouter/hspB/ets/common/utils/Logger";
export function HspBPageTwoBuilder(name: string, param: Object, parent = null) {
    {
        (parent ? parent : this).observeComponentCreation2((elmtId, isInitialRender) => {
            if (isInitialRender) {
                let componentCall = new HspBPageTwo(parent ? parent : this, {}, undefined, elmtId, () => { }, { page: "hspB/src/main/ets/pages/HspBPageTwo.ets", line: 20, col: 3 });
                ViewPU.create(componentCall);
                let paramsLambda = () => {
                    return {};
                };
                componentCall.paramsGenerator_ = paramsLambda;
            }
            else {
                (parent ? parent : this).updateStateVarsOfChildByElmtId(elmtId, {});
            }
        }, { name: "HspBPageTwo" });
    }
}
const COLUMN_SPACE: number = 12;
export class HspBPageTwo extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.pageInfos = new NavPathStack();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: HspBPageTwo_Params) {
        if (params.pageInfos !== undefined) {
            this.pageInfos = params.pageInfos;
        }
    }
    updateStateVars(params: HspBPageTwo_Params) {
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
            NavDestination.create(() => {
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Column.create({ space: 12 });
                    Column.width({ "id": 83886100, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Column.height({ "id": 83886099, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Column.justifyContent(FlexAlign.End);
                    Column.padding({
                        bottom: { "id": 83886085, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" },
                        left: { "id": 83886085, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" },
                        right: { "id": 83886085, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }
                    });
                }, Column);
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886086, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Clear all pages in the stack.
                        this.pageInfos.clear();
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886088, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('pageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886089, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('pageTwo', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886095, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HspAPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886096, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HspAPageTwo', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886097, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HspBPageOne', null);
                    });
                }, Button);
                Button.pop();
                Column.pop();
            }, { moduleName: "hspB", pagePath: "hspB/src/main/ets/pages/HspBPageTwo" });
            NavDestination.title('hspB-pageTwo');
            NavDestination.onReady((context: NavDestinationContext) => {
                this.pageInfos = context.pathStack;
                Logger.info('current page config info is ' + JSON.stringify(context.getConfigInRouteMap()));
            });
        }, NavDestination);
        NavDestination.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
(function () {
    if (typeof NavigationBuilderRegister === "function") {
        NavigationBuilderRegister("HspBPageTwo", wrapBuilder(HspBPageTwoBuilder));
    }
})();
