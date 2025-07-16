if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface HspBPageOne_Params {
    pageInfos?: NavPathStack;
}
import Logger from "@bundle:com.samples.systemrouter/hspB/ets/common/utils/Logger";
export function HspBPageOneBuilder(name: string, param: Object, parent = null) {
    {
        (parent ? parent : this).observeComponentCreation2((elmtId, isInitialRender) => {
            if (isInitialRender) {
                let componentCall = new HspBPageOne(parent ? parent : this, {}, undefined, elmtId, () => { }, { page: "hspB/src/main/ets/pages/HspBPageOne.ets", line: 20, col: 3 });
                ViewPU.create(componentCall);
                let paramsLambda = () => {
                    return {};
                };
                componentCall.paramsGenerator_ = paramsLambda;
            }
            else {
                (parent ? parent : this).updateStateVarsOfChildByElmtId(elmtId, {});
            }
        }, { name: "HspBPageOne" });
    }
}
const COLUMN_SPACE: number = 12;
export class HspBPageOne extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.pageInfos = new NavPathStack();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: HspBPageOne_Params) {
        if (params.pageInfos !== undefined) {
            this.pageInfos = params.pageInfos;
        }
    }
    updateStateVars(params: HspBPageOne_Params) {
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
                    Button.createWithLabel({ "id": 83886091, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarAPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886092, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarAPageTwo', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886093, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarBPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 83886094, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 83886084, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.height({ "id": 83886082, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "hspB" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarBPageTwo', null);
                    });
                }, Button);
                Button.pop();
                Column.pop();
            }, { moduleName: "hspB", pagePath: "hspB/src/main/ets/pages/HspBPageOne" });
            NavDestination.title('hspB-pageOne');
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
        NavigationBuilderRegister("HspBPageOne", wrapBuilder(HspBPageOneBuilder));
    }
})();
