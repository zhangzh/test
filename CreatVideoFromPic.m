function CreatVideoFromPic(dn, picformat,aviname)
% CreatVideoFromPic(dn, picformat,aviname)
% ��ĳ���ļ�����ĳ�ָ�ʽ������ͼƬ�ϳ�Ϊ��Ƶ�ļ�
% dn : �洢ͼƬ���ļ���
% picformat : Ҫ��ȡ��ͼƬ�ĸ�ʽ����png��jpg����ʽ���ַ�������
% aviname   : �洢����Ƶ���ļ���
% example : CreatVideoFromPic( './', 'png','presentation.avi');

    if ~exist(dn, 'dir')
        error('dir not exist!!!!');
    end
    picname=fullfile( dn, strcat('*.',picformat));
    picname=dir(picname);

    aviobj = VideoWriter(aviname);

    open(aviobj);

    for i=1:length(picname)
        picdata=imread( fullfile(dn, (picname(i,1).name)));		
        if ~isempty( aviobj.Height)
            if size(picdata,1) ~= aviobj.Height || size(picdata,2) ~= aviobj.Width
                close(aviobj);
                delete( aviname )
                error('����ͼƬ�ĳߴ�Ҫ��ͬ����');
            end
        end
        writeVideo(aviobj,picdata);
    end
    close(aviobj);
end
