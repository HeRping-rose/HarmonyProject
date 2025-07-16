if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface PageOne_Params {
    pageInfos?: NavPathStack;
}
import Logger from "@bundle:com.samples.systemrouter/entry/ets/common/utils/Logger";
export function PageOneBuilder(name: string, param: Object, parent = null) {
    {
        (parent ? parent : this).observeComponentCreation2((elmtId, isInitialRender) => {
            if (isInitialRender) {
                let componentCall = new PageOne(parent ? parent : this, {}, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/EntryPageOne.ets", line: 20, col: 3 });
                ViewPU.create(componentCall);
                let paramsLambda = () => {
                    return {};
                };
                componentCall.paramsGenerator_ = paramsLambda;
            }
            else {
                (parent ? parent : this).updateStateVarsOfChildByElmtId(elmtId, {});
            }
        }, { name: "PageOne" });
    }
}
const COLUMN_SPACE: number = 12;
export class PageOne extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.pageInfos = new NavPathStack();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: PageOne_Params) {
        if (params.pageInfos !== undefined) {
            this.pageInfos = params.pageInfos;
        }
    }
    updateStateVars(params: PageOne_Params) {
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
                    Column.create({ space: COLUMN_SPACE });
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
                    Button.createWithLabel({ "id": 16777223, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
                    Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
                    Button.onClick(() => {
                        //Clear all pages in the stack.
                        this.pageInfos.clear();
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
                    Button.createWithLabel({ "id": 16777229, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
                    Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarBPageOne', null);
                    });
                }, Button);
                Button.pop();
                this.observeComponentCreation2((elmtId, isInitialRender) => {
                    Button.createWithLabel({ "id": 16777230, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" }, { stateEffect: true, type: ButtonType.Capsule });
                    Button.width({ "id": 16777221, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
                    Button.height({ "id": 16777220, "type": 10003, params: [], "bundleName": "com.samples.systemrouter", "moduleName": "entry" });
                    Button.onClick(() => {
                        //Push the NavDestination page information specified by name onto the stack, and pass the data as param.
                        this.pageInfos.pushPathByName('HarBPageTwo', null);
                    });
                }, Button);
                Button.pop();
                Column.pop();
            }, { moduleName: "entry", pagePath: "entry/src/main/ets/pages/EntryPageOne" });
            NavDestination.title('entry-pageOne');
            NavDestination.onReady((context: NavDestinationContext) => {
                this.pageInfos = context.pathStack;
                Logger.info("current page config info is " + JSON.stringify(context.getConfigInRouteMap()));
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
        NavigationBuilderRegister("pageOne", wrapBuilder(PageOneBuilder));
    }
})();
