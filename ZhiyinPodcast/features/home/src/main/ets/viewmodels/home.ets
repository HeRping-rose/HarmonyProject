export  interface Banner {
  id: string,
  imgUrl: ResourceStr,
  hrfUrl: ResourceStr,
  type: string

}

export interface quickCategory {
  icon: ResourceStr;
  name: string;
}

export interface podcastExpress {
  tag: string;
  title: string;
  author: string;
}

export class podcast {
  title: string = '';
  category: string = '';
}

export interface popularPodcast {
  rank: number;
  title: string;
  category: string;
}

export interface EditorChoice {
  imgUrl: ResourceStr;
  title: string;//标题
  authorAvatar: ResourceStr;
  author: string;
  subtitle: string; //副标题
}
//最近新上
export interface RecentlyNew {
  imgUrl: ResourceStr;
  title: string;
  authorAvatar: ResourceStr;
  author: ResourceStr;
  listenCount: number;
  signature: string; //描述
}