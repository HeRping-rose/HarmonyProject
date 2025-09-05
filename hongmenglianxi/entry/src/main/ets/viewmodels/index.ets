export class ImageInfo {
  image: string | ResourceStr = '';
  txt: string = '';

  constructor(image: ResourceStr | string, txt: string) {
    this.image = image;
    this.txt = txt;
  }
}